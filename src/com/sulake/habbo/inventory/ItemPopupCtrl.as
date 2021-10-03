package com.sulake.habbo.inventory
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ItemPopupCtrl
   {
      
      public static const const_1076:int = 1;
      
      public static const const_563:int = 2;
      
      private static const const_946:int = 5;
      
      private static const const_1325:int = 250;
      
      private static const const_1324:int = 100;
      
      private static const const_1323:int = 180;
      
      private static const const_1322:int = 200;
       
      
      private var var_349:Timer;
      
      private var var_348:Timer;
      
      private var _assets:IAssetLibrary;
      
      private var var_76:IWindowContainer;
      
      private var _parent:IWindowContainer;
      
      private var var_1812:int = 2;
      
      private var var_752:BitmapData;
      
      private var var_932:BitmapData;
      
      public function ItemPopupCtrl(param1:IWindowContainer, param2:IAssetLibrary)
      {
         this.var_349 = new Timer(const_1325,1);
         this.var_348 = new Timer(const_1324,1);
         super();
         if(param1 == null)
         {
            return;
         }
         if(param2 == null)
         {
            return;
         }
         this.var_76 = param1;
         this.var_76.visible = false;
         this._assets = param2;
         this.var_349.addEventListener(TimerEvent.TIMER,this.onDisplayTimer);
         this.var_348.addEventListener(TimerEvent.TIMER,this.onHideTimer);
         var _loc3_:BitmapDataAsset = this._assets.getAssetByName("popup_arrow_right_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            this.var_932 = _loc3_.content as BitmapData;
         }
         _loc3_ = this._assets.getAssetByName("popup_arrow_left_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            this.var_752 = _loc3_.content as BitmapData;
         }
      }
      
      public function dispose() : void
      {
         if(this.var_349 != null)
         {
            this.var_349.removeEventListener(TimerEvent.TIMER,this.onDisplayTimer);
            this.var_349.stop();
            this.var_349 = null;
         }
         if(this.var_348 != null)
         {
            this.var_348.removeEventListener(TimerEvent.TIMER,this.onHideTimer);
            this.var_348.stop();
            this.var_348 = null;
         }
         this._assets = null;
         this.var_76 = null;
         this._parent = null;
         this.var_752 = null;
         this.var_932 = null;
      }
      
      public function updateContent(param1:IWindowContainer, param2:String, param3:BitmapData, param4:int = 2) : void
      {
         var _loc7_:* = null;
         if(this.var_76 == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(param3 == null)
         {
            param3 = new BitmapData(1,1,true,16777215);
         }
         if(this._parent != null)
         {
            this._parent.removeChild(this.var_76);
         }
         this._parent = param1;
         this.var_1812 = param4;
         var _loc5_:ITextWindow = ITextWindow(this.var_76.findChildByName("item_name_text"));
         if(_loc5_)
         {
            _loc5_.text = param2;
         }
         var _loc6_:IBitmapWrapperWindow = this.var_76.findChildByName("item_image") as IBitmapWrapperWindow;
         if(_loc6_)
         {
            _loc7_ = new BitmapData(Math.min(const_1323,param3.width),Math.min(const_1322,param3.height),true,16777215);
            _loc7_.copyPixels(param3,new Rectangle(0,0,_loc7_.width,_loc7_.height),new Point(0,0),null,null,true);
            _loc6_.bitmap = _loc7_;
            _loc6_.width = _loc6_.bitmap.width;
            _loc6_.height = _loc6_.bitmap.height;
            _loc6_.x = (this.var_76.width - _loc6_.width) / 2;
            this.var_76.height = _loc6_.rectangle.bottom + 10;
         }
      }
      
      public function show() : void
      {
         this.var_348.reset();
         this.var_349.reset();
         if(this._parent == null)
         {
            return;
         }
         this.var_76.visible = true;
         this._parent.addChild(this.var_76);
         this.refreshArrow(this.var_1812);
         switch(this.var_1812)
         {
            case const_1076:
               this.var_76.x = -1 * this.var_76.width - const_946;
               break;
            case const_563:
               this.var_76.x = this._parent.width + const_946;
         }
         this.var_76.y = (this._parent.height - this.var_76.height) / 2;
      }
      
      public function hide() : void
      {
         this.var_76.visible = false;
         this.var_348.reset();
         this.var_349.reset();
         if(this._parent != null)
         {
            this._parent.removeChild(this.var_76);
         }
      }
      
      public function showDelayed() : void
      {
         this.var_348.reset();
         this.var_349.reset();
         this.var_349.start();
      }
      
      public function hideDelayed() : void
      {
         this.var_348.reset();
         this.var_349.reset();
         this.var_348.start();
      }
      
      private function refreshArrow(param1:int = 2) : void
      {
         if(this.var_76 == null || this.var_76.disposed)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(this.var_76.findChildByName("arrow_pointer"));
         if(!_loc2_)
         {
            return;
         }
         switch(param1)
         {
            case const_1076:
               _loc2_.bitmap = this.var_932.clone();
               _loc2_.width = this.var_932.width;
               _loc2_.height = this.var_932.height;
               _loc2_.y = (this.var_76.height - this.var_932.height) / 2;
               _loc2_.x = this.var_76.width - 1;
               break;
            case const_563:
               _loc2_.bitmap = this.var_752.clone();
               _loc2_.width = this.var_752.width;
               _loc2_.height = this.var_752.height;
               _loc2_.y = (this.var_76.height - this.var_752.height) / 2;
               _loc2_.x = -1 * this.var_752.width + 1;
         }
         _loc2_.invalidate();
      }
      
      private function onDisplayTimer(param1:TimerEvent) : void
      {
         this.show();
      }
      
      private function onHideTimer(param1:TimerEvent) : void
      {
         this.hide();
      }
   }
}
