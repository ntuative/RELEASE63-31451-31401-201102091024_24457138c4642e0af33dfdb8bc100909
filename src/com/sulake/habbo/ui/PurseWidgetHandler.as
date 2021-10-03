package com.sulake.habbo.ui
{
   import com.sulake.habbo.catalog.enum.CatalogPageName;
   import com.sulake.habbo.catalog.purse.IPurse;
   import com.sulake.habbo.catalog.purse.Purse;
   import com.sulake.habbo.catalog.purse.PurseEvent;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.habbo.widget.events.RoomWidgetPurseUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetGetPurseData;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetOpenCatalogMessage;
   import flash.events.Event;
   
   public class PurseWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var _disposed:Boolean = false;
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      public function PurseWidgetHandler()
      {
         super();
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._container.catalog.events.removeEventListener(PurseEvent.const_64,this.purseEventHandler);
            this._container.catalog.events.removeEventListener(PurseEvent.const_104,this.purseEventHandler);
            this._container = null;
            this._disposed = true;
         }
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_395;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         this._container = param1;
         if(this._container.catalog)
         {
            this._container.catalog.events.addEventListener(PurseEvent.const_64,this.purseEventHandler);
            this._container.catalog.events.addEventListener(PurseEvent.const_104,this.purseEventHandler);
         }
      }
      
      public function getWidgetMessages() : Array
      {
         var _loc1_:* = [];
         _loc1_.push(RoomWidgetGetPurseData.const_710);
         _loc1_.push(RoomWidgetOpenCatalogMessage.const_368);
         return _loc1_;
      }
      
      public function getProcessedEvents() : Array
      {
         return [];
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(!param1)
         {
            return null;
         }
         switch(param1.type)
         {
            case RoomWidgetGetPurseData.const_710:
               _loc2_ = this._container.catalog.getPurse();
               this._container.events.dispatchEvent(new RoomWidgetPurseUpdateEvent(RoomWidgetPurseUpdateEvent.const_64,_loc2_.credits));
               this._container.events.dispatchEvent(new RoomWidgetPurseUpdateEvent(RoomWidgetPurseUpdateEvent.const_104,_loc2_.getActivityPointsForType(Purse.const_181)));
               break;
            case RoomWidgetOpenCatalogMessage.const_368:
               _loc3_ = param1 as RoomWidgetOpenCatalogMessage;
               if(this._container.catalog != null)
               {
                  switch(_loc3_.pageKey)
                  {
                     case RoomWidgetOpenCatalogMessage.const_1007:
                        this._container.catalog.openCatalogPage(CatalogPageName.const_1445);
                        break;
                     case RoomWidgetOpenCatalogMessage.const_1053:
                        this._container.catalog.openCreditsHabblet();
                  }
               }
               break;
            default:
               Logger.log(param1.type);
         }
         return null;
      }
      
      private function purseEventHandler(param1:PurseEvent) : void
      {
         var _loc2_:* = null;
         switch(param1.type)
         {
            case PurseEvent.const_64:
               _loc2_ = new RoomWidgetPurseUpdateEvent(RoomWidgetPurseUpdateEvent.const_64,param1.balance);
               break;
            case PurseEvent.const_104:
               _loc2_ = new RoomWidgetPurseUpdateEvent(RoomWidgetPurseUpdateEvent.const_104,param1.balance);
         }
         if(_loc2_)
         {
            this._container.events.dispatchEvent(_loc2_);
         }
      }
      
      public function processEvent(param1:Event) : void
      {
      }
      
      public function update() : void
      {
      }
   }
}
