package com.sulake.habbo.inventory.pets
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.avatar.IPetImageListener;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   import com.sulake.habbo.inventory.IInventoryView;
   import com.sulake.habbo.inventory.furni.FurniModel;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class PetsView implements IInventoryView, IPetImageListener, IGetImageListener
   {
       
      
      private const const_1989:int = 0;
      
      private const const_920:int = 1;
      
      private const const_1683:int = 2;
      
      private const const_1682:int = 3;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _view:IWindowContainer;
      
      private var var_64:PetsModel;
      
      private var _disposed:Boolean = false;
      
      private var var_485:IItemGridWindow;
      
      private var _roomEngine:IRoomEngine;
      
      private var _avatarRenderer:IAvatarRenderManager;
      
      private var var_584:Map;
      
      private var var_341:PetsGridItem;
      
      private var var_2474:int = 0;
      
      public function PetsView(param1:PetsModel, param2:IHabboWindowManager, param3:IAssetLibrary, param4:IHabboLocalizationManager, param5:IRoomEngine, param6:IAvatarRenderManager)
      {
         var _loc11_:* = null;
         super();
         this.var_64 = param1;
         this._assetLibrary = param3;
         this._windowManager = param2;
         this._roomEngine = param5;
         this._avatarRenderer = param6;
         this.var_584 = new Map();
         var _loc7_:XmlAsset = this._assetLibrary.getAssetByName("inventory_pets_view_xml") as XmlAsset;
         if(_loc7_ == null || _loc7_.content == null)
         {
            return;
         }
         this._view = this._windowManager.buildFromXML(_loc7_.content as XML) as IWindowContainer;
         if(this._view == null)
         {
            return;
         }
         this._view.visible = false;
         this._view.procedure = this.windowEventHandler;
         this.var_485 = this._view.findChildByName("grid") as IItemGridWindow;
         var _loc8_:IBitmapWrapperWindow = this._view.findChildByName("download_image") as IBitmapWrapperWindow;
         _loc8_.bitmap = new BitmapData(_loc8_.width,_loc8_.height);
         var _loc9_:BitmapData = this._assetLibrary.getAssetByName("download_icon_png").content as BitmapData;
         _loc8_.bitmap.copyPixels(_loc9_,_loc9_.rect,new Point((_loc8_.width - _loc9_.width) / 2,(_loc8_.height - _loc9_.height) / 2),null,null,true);
         _loc8_ = this._view.findChildByName("image") as IBitmapWrapperWindow;
         _loc8_.bitmap = new BitmapData(_loc8_.width,_loc8_.height);
         var _loc10_:BitmapData = this._assetLibrary.getAssetByName("inventory_empty_png").content as BitmapData;
         _loc8_.bitmap.copyPixels(_loc10_,_loc10_.rect,new Point((_loc8_.width - _loc10_.width) / 2,(_loc8_.height - _loc10_.height) / 2),null,null,true);
         _loc11_ = this._view.findChildByName("place_button") as IButtonWindow;
         if(_loc11_ != null)
         {
            _loc11_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.placeButtonClickHandler);
         }
         _loc11_ = this._view.findChildByName("open_catalog_btn") as IButtonWindow;
         if(_loc11_ != null)
         {
            _loc11_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.catalogButtonClickHandler);
         }
         this.selectPetsTab();
         this.updatePreview();
         this.setViewToState();
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._windowManager = null;
            this.var_64 = null;
            this._view = null;
            this._disposed = true;
         }
      }
      
      public function update() : void
      {
         this.updateGrid();
         this.updatePreview(this.var_341);
      }
      
      public function removePet(param1:int) : void
      {
         var _loc2_:PetsGridItem = this.var_584.remove(param1) as PetsGridItem;
         if(_loc2_ == null)
         {
            return;
         }
         this.var_485.removeGridItem(_loc2_.window);
         if(this.var_341 == _loc2_)
         {
            this.var_341 = null;
            this.selectFirst();
         }
      }
      
      private function selectFirst() : void
      {
         if(this.var_584 == null || this.var_584.length == 0)
         {
            this.updatePreview();
            return;
         }
         this.setSelectedGridItem(this.var_584.getWithIndex(0));
      }
      
      public function addPet(param1:PetData) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(this.var_584.getValue(param1.id) != null)
         {
            return;
         }
         var _loc2_:PetsGridItem = new PetsGridItem(this,param1,this._windowManager,this._assetLibrary,this._avatarRenderer);
         if(_loc2_ != null)
         {
            this.var_485.addGridItem(_loc2_.window);
            this.var_584.add(param1.id,_loc2_);
            if(this.var_341 == null)
            {
               this.selectFirst();
            }
         }
      }
      
      private function updateGrid() : void
      {
         var _loc2_:* = null;
         if(this._view == null)
         {
            return;
         }
         this.var_485.removeGridItems();
         this.var_584.reset();
         var _loc1_:Map = this.var_64.pets;
         if(_loc1_ == null)
         {
            return;
         }
         for each(_loc2_ in _loc1_)
         {
            this.addPet(_loc2_);
         }
      }
      
      private function catalogButtonClickHandler(param1:WindowMouseEvent) : void
      {
         this.var_64.requestCatalogOpen();
      }
      
      private function placeButtonClickHandler(param1:WindowMouseEvent) : void
      {
         if(this.var_341 == null)
         {
            return;
         }
         var _loc2_:PetData = this.var_341.pet;
         if(_loc2_ == null)
         {
            return;
         }
         this.placePetToRoom(_loc2_.id);
      }
      
      public function placePetToRoom(param1:int, param2:Boolean = false) : void
      {
         this.var_64.placePetToRoom(param1,param2);
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         if(this._view == null)
         {
            return null;
         }
         if(this._view.disposed)
         {
            return null;
         }
         return this._view;
      }
      
      private function windowEventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowEvent.const_59)
         {
            switch(param2.name)
            {
               case "tab_floor":
                  this.var_64.switchCategory(FurniModel.const_42);
                  break;
               case "tab_wall":
                  this.var_64.switchCategory(FurniModel.const_46);
            }
            this.selectPetsTab();
         }
      }
      
      private function selectPetsTab() : void
      {
         if(this._view == null)
         {
            return;
         }
         var _loc1_:ISelectorWindow = this._view.findChildByName("category_selector") as ISelectorWindow;
         if(_loc1_ != null)
         {
            _loc1_.setSelected(_loc1_.getSelectableByName("tab_pets"));
         }
      }
      
      public function setSelectedGridItem(param1:PetsGridItem) : void
      {
         if(this.var_341 != null)
         {
            this.var_341.setSelected(false);
         }
         this.var_341 = param1;
         if(this.var_341 != null)
         {
            this.var_341.setSelected(true);
         }
         this.updatePreview(param1);
      }
      
      public function setViewToState() : void
      {
         var _loc2_:int = 0;
         var _loc1_:Map = this.var_64.pets;
         if(!this.var_64.isListInited())
         {
            _loc2_ = this.const_920;
         }
         else if(!_loc1_ || _loc1_.length == 0)
         {
            _loc2_ = this.const_1683;
         }
         else
         {
            _loc2_ = this.const_1682;
         }
         if(this.var_2474 == _loc2_)
         {
            return;
         }
         this.var_2474 = _loc2_;
         var _loc3_:IWindowContainer = this._view.findChildByName("loading_container") as IWindowContainer;
         var _loc4_:IWindowContainer = this._view.findChildByName("empty_container") as IWindowContainer;
         var _loc5_:IWindowContainer = this._view.findChildByName("grid_container") as IWindowContainer;
         var _loc6_:IWindowContainer = this._view.findChildByName("preview_container") as IWindowContainer;
         switch(_loc2_)
         {
            case this.const_920:
               _loc3_.visible = true;
               _loc4_.visible = false;
               _loc5_.visible = false;
               _loc6_.visible = false;
               break;
            case this.const_1683:
               _loc3_.visible = false;
               _loc4_.visible = true;
               _loc5_.visible = false;
               _loc6_.visible = false;
               break;
            case this.const_1682:
               _loc3_.visible = false;
               _loc4_.visible = false;
               _loc5_.visible = true;
               _loc6_.visible = true;
               this.updateGrid();
               this.updatePreview();
         }
      }
      
      private function updatePreview(param1:PetsGridItem = null) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:Boolean = false;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         if(this._view == null)
         {
            return;
         }
         if(param1 == null || param1.pet == null)
         {
            _loc2_ = new BitmapData(1,1);
            _loc3_ = "";
            _loc4_ = "";
            _loc5_ = false;
         }
         else
         {
            _loc12_ = param1.pet;
            _loc3_ = _loc12_.name;
            _loc13_ = _loc12_.figure;
            _loc2_ = this.getPetImage(_loc13_,4,true);
            _loc5_ = true;
         }
         var _loc6_:IBitmapWrapperWindow = this._view.findChildByName("preview_image") as IBitmapWrapperWindow;
         if(_loc6_ != null)
         {
            _loc14_ = new BitmapData(_loc6_.width,_loc6_.height);
            _loc14_.fillRect(_loc14_.rect,0);
            _loc14_.copyPixels(_loc2_,_loc2_.rect,new Point(_loc14_.width / 2 - _loc2_.width / 2,_loc14_.height / 2 - _loc2_.height / 2));
            _loc6_.bitmap = _loc14_;
         }
         _loc2_.dispose();
         var _loc7_:ITextWindow = this._view.findChildByName("preview_text") as ITextWindow;
         if(_loc7_ != null)
         {
            _loc7_.caption = _loc3_;
         }
         _loc7_ = this._view.findChildByName("preview_description") as ITextWindow;
         if(_loc7_ != null)
         {
            _loc7_.caption = _loc4_;
         }
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         if(this.var_64.roomSession != null)
         {
            _loc8_ = this.var_64.roomSession.arePetsAllowed;
            _loc9_ = this.var_64.roomSession.isRoomOwner;
         }
         var _loc10_:String = "";
         if(!_loc9_)
         {
            if(_loc8_)
            {
               _loc10_ = "${inventory.pets.allowed}";
            }
            else
            {
               _loc10_ = "${inventory.pets.forbidden}";
            }
         }
         _loc7_ = this._view.findChildByName("preview_info") as ITextWindow;
         if(_loc7_ != null)
         {
            _loc7_.caption = _loc10_;
         }
         var _loc11_:IButtonWindow = this._view.findChildByName("place_button") as IButtonWindow;
         if(_loc11_ != null)
         {
            if(_loc5_ && (_loc9_ || _loc8_))
            {
               _loc11_.enable();
            }
            else
            {
               _loc11_.disable();
            }
         }
      }
      
      public function getPetImage(param1:String, param2:int, param3:Boolean) : BitmapData
      {
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = this.getPetType(param1);
         if(_loc5_ < 8)
         {
            _loc6_ = this._avatarRenderer.createPetImageFromFigure(param1,AvatarScaleType.const_54,this);
            if(_loc6_ != null)
            {
               _loc6_.setDirection(AvatarSetType.const_34,param2);
               if(param3)
               {
                  _loc4_ = _loc6_.getCroppedImage(AvatarSetType.const_34);
               }
               else
               {
                  _loc4_ = _loc6_.getCroppedImage(AvatarSetType.const_47);
               }
               _loc6_.dispose();
            }
         }
         else
         {
            _loc7_ = this.getPetRace(param1);
            _loc8_ = 0;
            _loc9_ = this._roomEngine.getPetImage(_loc5_,_loc7_,new Vector3d(param2 * 45),64,this,_loc8_);
            if(_loc9_ != null)
            {
               _loc4_ = _loc9_.data;
            }
         }
         if(_loc4_ == null)
         {
            _loc4_ = new BitmapData(30,30,false,4289374890);
         }
         return _loc4_;
      }
      
      private function getPetType(param1:String) : int
      {
         return this.getSpaceSeparatedInteger(param1,0);
      }
      
      private function getPetRace(param1:String) : int
      {
         return this.getSpaceSeparatedInteger(param1,1);
      }
      
      private function getSpaceSeparatedInteger(param1:String, param2:int) : int
      {
         var _loc3_:* = null;
         if(param1 != null)
         {
            _loc3_ = param1.split(" ");
            if(_loc3_.length > param2)
            {
               return int(_loc3_[param2]);
            }
         }
         return -1;
      }
      
      public function petImageReady(param1:String) : void
      {
         this.update();
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         param2.dispose();
         this.update();
      }
   }
}
