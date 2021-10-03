package com.sulake.habbo.widget.purse
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetPurseUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetGetPurseData;
   import com.sulake.habbo.widget.messages.RoomWidgetOpenCatalogMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   
   public class PurseWidget extends RoomWidgetBase
   {
       
      
      private var var_737:Boolean = false;
      
      private var _view:IWindowContainer;
      
      private var var_2354:int;
      
      private var var_2368:int;
      
      public function PurseWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager)
      {
         var _loc5_:* = null;
         super(param1,param2,param3);
         var _loc4_:XmlAsset = param2.getAssetByName("purse_widget") as XmlAsset;
         if(_loc4_)
         {
            this._view = param1.buildFromXML(_loc4_.content as XML,1) as IWindowContainer;
            _loc5_ = this._view.desktop;
            this._view.x = _loc5_.width - this._view.width - 100;
            this._view.y = -5;
            this._view.visible = false;
            this._view.findChildByName("credits_container").addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onCreditsClick);
            this._view.findChildByName("pixels_container").addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onPixelsClick);
         }
      }
      
      override public function initialize(param1:int = 0) : void
      {
         messageListener.processWidgetMessage(new RoomWidgetGetPurseData());
         if(this._view)
         {
            this._view.visible = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this.var_737;
      }
      
      override public function dispose() : void
      {
         if(this.var_737)
         {
            return;
         }
         if(this._view)
         {
            this._view.dispose();
         }
         super.dispose();
         this.var_737 = true;
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(!param1)
         {
            return;
         }
         param1.addEventListener(RoomWidgetPurseUpdateEvent.const_64,this.onCreditBalance);
         param1.addEventListener(RoomWidgetPurseUpdateEvent.const_104,this.onPixelBalance);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetPurseUpdateEvent.const_64,this.onCreditBalance);
         param1.removeEventListener(RoomWidgetPurseUpdateEvent.const_104,this.onPixelBalance);
      }
      
      private function onCreditBalance(param1:RoomWidgetPurseUpdateEvent) : void
      {
         this.var_2354 = param1.balance;
         if(this._view)
         {
            this._view.findChildByName("credits").caption = this.var_2354.toString();
         }
      }
      
      private function onPixelBalance(param1:RoomWidgetPurseUpdateEvent) : void
      {
         this.var_2368 = param1.balance;
         if(this._view)
         {
            this._view.findChildByName("pixels").caption = this.var_2368.toString();
         }
      }
      
      private function onCreditsClick(param1:WindowMouseEvent) : void
      {
         messageListener.processWidgetMessage(new RoomWidgetOpenCatalogMessage(RoomWidgetOpenCatalogMessage.const_1053));
      }
      
      private function onPixelsClick(param1:WindowMouseEvent) : void
      {
         messageListener.processWidgetMessage(new RoomWidgetOpenCatalogMessage(RoomWidgetOpenCatalogMessage.const_1007));
      }
   }
}
