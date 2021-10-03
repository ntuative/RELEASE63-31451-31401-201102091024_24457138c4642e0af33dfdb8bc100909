package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.pets.IBreed;
   import com.sulake.habbo.avatar.pets.IPetData;
   import com.sulake.habbo.avatar.pets.IPetDataListener;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetApproveNameResultEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetPurchaseOverrideEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetsInitializedEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.room.PetColorResult;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.display.BitmapDataChannel;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class NewPetsCatalogWidget extends CatalogWidget implements ICatalogWidget, IPetDataListener, IGetImageListener
   {
      
      private static const const_1293:int = 20;
       
      
      private var _offers:Map;
      
      private var _name:String;
      
      private var var_829:int = -1;
      
      private var var_477:int = 0;
      
      private var var_576:BitmapData = null;
      
      private var var_1075:BitmapData = null;
      
      private var var_830:Boolean = false;
      
      private var var_552:Array;
      
      private var var_737:Boolean = false;
      
      public function NewPetsCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
         this.var_576 = new BitmapData(16,16,true,0);
         this.var_576.fillRect(new Rectangle(2,2,12,12),4278190080);
         this.var_1075 = new BitmapData(16,16,true,4278190080);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(this.var_737)
         {
            return;
         }
         if(page && false && page.viewer.catalog)
         {
            _loc1_ = page.viewer.catalog as HabboCatalog;
         }
         this.var_830 = false;
         this._offers.dispose();
         this._offers = null;
         this.var_552 = null;
         super.dispose();
         this.var_737 = true;
      }
      
      override public function init() : void
      {
         super.init();
         this.var_830 = false;
         var _loc1_:IWindow = window.findChildByName("ctlg_buy_button");
         var _loc2_:ITextFieldWindow = window.findChildByName("name_input_text") as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.addEventListener(WindowEvent.const_103,this.onTextWindowEvent);
         this._offers = new Map();
         if(page.offers.length == 0)
         {
            return;
         }
         var _loc3_:Offer = page.offers[0];
         this.var_829 = this.getPetTypeIndexFromProduct(_loc3_.localizationId);
         this.initializePetImages();
         this._offers.add(this.var_829,_loc3_);
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,this.onSelectProduct);
         events.addEventListener(WidgetEvent.const_720,this.onApproveNameResult);
         events.addEventListener(WidgetEvent.CWE_WIDGETS_INITIALIZED,this.onWidgetsInitialized);
      }
      
      private function initializePetImages() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         this.var_552 = [];
         if(page && false && page.viewer.catalog)
         {
            _loc2_ = page.viewer.catalog as HabboCatalog;
            if(_loc2_ && _loc2_.avatarRenderManager && _loc2_.avatarRenderManager.petDataManager)
            {
               _loc3_ = _loc2_.avatarRenderManager.petDataManager.getPetData(this.var_829,this);
               if(_loc3_)
               {
                  this.var_552 = _loc3_.sellableBreeds;
               }
            }
         }
         var _loc1_:int = 0;
         while(_loc1_ < const_1293)
         {
            _loc4_ = window.findChildByName("palette_" + _loc1_) as IBitmapWrapperWindow;
            if(_loc4_ != null)
            {
               _loc5_ = null;
               _loc6_ = (page.viewer.catalog as HabboCatalog).roomEngine.getPetColor(8,_loc1_);
               if(_loc6_ != null)
               {
                  _loc5_ = new BitmapData(_loc4_.width,_loc4_.height,true,_loc6_.primaryColor);
                  _loc5_.fillRect(new Rectangle(_loc5_.width / 2,0,_loc5_.width / 2,_loc5_.height),_loc6_.secondaryColor);
               }
               else
               {
                  _loc5_ = new BitmapData(_loc4_.width,_loc4_.height,true,4292730333);
               }
               _loc4_.bitmap = _loc5_;
               _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onPaletteEntryClick);
               _loc4_.id = _loc1_;
               if(_loc1_ == this.var_477)
               {
                  _loc5_.copyChannel(this.var_576,this.var_576.rect,new Point(0,0),BitmapDataChannel.ALPHA,BitmapDataChannel.ALPHA);
               }
               else
               {
                  _loc5_.copyChannel(this.var_576,this.var_576.rect,new Point(0,0),BitmapDataChannel.ALPHA,BitmapDataChannel.ALPHA);
                  _loc5_.copyChannel(this.var_1075,this.var_1075.rect,new Point(0,0),BitmapDataChannel.ALPHA,BitmapDataChannel.ALPHA);
               }
            }
            _loc1_++;
         }
      }
      
      private function onWidgetsInitialized(param1:CatalogWidgetsInitializedEvent = null) : void
      {
         if(this.var_737)
         {
            return;
         }
         events.dispatchEvent(new CatalogWidgetPurchaseOverrideEvent(this.onPurchase));
         var _loc2_:Offer = this._offers.getWithIndex(0);
         if(_loc2_ != null)
         {
            events.dispatchEvent(new SelectProductEvent(_loc2_));
         }
      }
      
      private function onPaletteEntryClick(param1:WindowMouseEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:IBitmapWrapperWindow = param1.target as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc3_ = window.findChildByName("palette_" + this.var_477) as IBitmapWrapperWindow;
            if(_loc3_ != null)
            {
               _loc3_.bitmap.copyChannel(this.var_1075,this.var_1075.rect,new Point(0,0),BitmapDataChannel.ALPHA,BitmapDataChannel.ALPHA);
               _loc3_.invalidate();
            }
            _loc2_.bitmap.copyChannel(this.var_576,this.var_576.rect,new Point(0,0),BitmapDataChannel.ALPHA,BitmapDataChannel.ALPHA);
            _loc2_.invalidate();
            this.var_477 = _loc2_.id;
            this.updateImage();
         }
      }
      
      private function getPetLocalization() : String
      {
         var _loc1_:* = null;
         if(page != null && false)
         {
            _loc1_ = page.viewer.catalog as HabboCatalog;
            if(_loc1_ != null && _loc1_.localization != null)
            {
               return _loc1_.localization.getKey(this.getRaceLocalizationKey(this.var_829,this.var_477),this.getRaceLocalizationKey(this.var_829,this.var_477));
            }
         }
         return this.getRaceLocalizationKey(this.var_829,this.var_477);
      }
      
      private function onPurchase(param1:WindowEvent) : void
      {
         if(this.var_830)
         {
            Logger.log("* Cannot buy a pet, pending previous name approval.");
         }
         if(this.getPurchaseParameters() == "")
         {
            return;
         }
         this.var_830 = true;
         (page.viewer.catalog as HabboCatalog).approveName(this._name,1);
      }
      
      private function onTextWindowEvent(param1:WindowEvent) : void
      {
         var _loc2_:ITextFieldWindow = param1.target as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         this._name = _loc2_.text;
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         this.updateImage();
      }
      
      private function onApproveNameResult(param1:CatalogWidgetApproveNameResultEvent) : void
      {
         var event:CatalogWidgetApproveNameResultEvent = param1;
         if(event == null || !this.var_830)
         {
            return;
         }
         this.var_830 = false;
         switch(event.result)
         {
            case 1:
               page.viewer.catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.long}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
               return;
            case 2:
               page.viewer.catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.short}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
               return;
            case 3:
               page.viewer.catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.chars}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
               return;
            case 4:
               page.viewer.catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.bobba}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
               return;
            default:
               var p:String = this.getPurchaseParameters();
               if(p == "")
               {
                  Logger.log("* Not enough information to buy a pet!");
                  return;
               }
               Logger.log("* Will buy pet as " + p);
               (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(this._offers.getWithIndex(0),page.pageId,p);
               return;
         }
      }
      
      private function updateImage() : void
      {
         var _loc1_:Offer = this._offers.getWithIndex(0);
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:IBreed = this.var_552[this.var_477] as IBreed;
         if(!_loc2_)
         {
            return;
         }
         var _loc4_:int = this.var_477;
         var _loc5_:ImageResult = (page.viewer.catalog as HabboCatalog).roomEngine.getPetImage(8,_loc4_,new Vector3d(135,0,0),64,this);
         if(_loc5_ != null)
         {
            this.setPreviewImage(_loc5_.data,true);
         }
         var _loc6_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         var _loc7_:ITextWindow = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         if(_loc7_ != null)
         {
            _loc6_.registerParameter("catalog.purchase.price.credits","credits",String(_loc1_.priceInCredits));
            _loc7_.caption = "${catalog.purchase.price.credits}";
         }
         var _loc8_:ITextWindow = _window.findChildByName("pet_breed_text") as ITextWindow;
         if(_loc8_)
         {
            _loc8_.caption = this.getPetLocalization();
         }
      }
      
      private function getPurchaseParameters() : String
      {
         if(this._name == null || this._name.length == 0)
         {
            page.viewer.catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.empty}",0,function(param1:IAlertDialog, param2:Event):void
            {
               param1.dispose();
            });
            return "";
         }
         var color:uint = 16777215;
         var breed:IBreed = this.var_552[this.var_477] as IBreed;
         var p:String = this._name + String.fromCharCode(10) + this.addZeroPadding(String(breed.id),3) + String.fromCharCode(10) + this.addZeroPadding(color.toString(16).toUpperCase(),6);
         return p;
      }
      
      private function setPreviewImage(param1:BitmapData, param2:Boolean) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(true)
         {
            if(param1 == null)
            {
               param1 = new BitmapData(1,1);
               param2 = true;
            }
            _loc3_ = window.findChildByName("ctlg_teaserimg_1") as IBitmapWrapperWindow;
            if(_loc3_ != null)
            {
               if(_loc3_.bitmap == null)
               {
                  _loc3_.bitmap = new BitmapData(_loc3_.width,_loc3_.height,true,16777215);
               }
               _loc3_.bitmap.fillRect(_loc3_.bitmap.rect,16777215);
               _loc4_ = 2;
               _loc5_ = new BitmapData(param1.width * _loc4_,param1.height * _loc4_,true,16777215);
               _loc5_.draw(param1,new Matrix(_loc4_,0,0,_loc4_));
               _loc6_ = new Point((_loc3_.width - _loc5_.width) / 2,(_loc3_.height - _loc5_.height) / 2);
               _loc3_.bitmap.copyPixels(_loc5_,_loc5_.rect,_loc6_,null,null,true);
               _loc3_.invalidate();
               _loc5_.dispose();
            }
         }
         if(param2)
         {
            param1.dispose();
         }
      }
      
      private function getPetTypeIndexFromProduct(param1:String) : int
      {
         if(param1.length == 0)
         {
            return 0;
         }
         return int(param1.charAt(param1.length - 1));
      }
      
      private function getRaceLocalizationKey(param1:int, param2:int) : String
      {
         return "pet.race." + param1 + "." + this.addZeroPadding(String(param2),3);
      }
      
      private function addZeroPadding(param1:String, param2:int) : String
      {
         while(param1.length < param2)
         {
            param1 = "0" + param1;
         }
         return param1;
      }
      
      public function petDataReady() : void
      {
         if(this.var_737)
         {
            return;
         }
         this.init();
         this.onWidgetsInitialized();
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         this.setPreviewImage(param2,true);
      }
   }
}
