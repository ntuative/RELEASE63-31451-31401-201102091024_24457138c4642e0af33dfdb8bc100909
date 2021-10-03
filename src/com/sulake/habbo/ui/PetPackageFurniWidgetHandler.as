package com.sulake.habbo.ui
{
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IPetImageListener;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.avatar.pets.IPetDataListener;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.session.events.RoomSessionPetPackageEvent;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.habbo.widget.events.RoomWidgetPetPackageUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetOpenPetPackageMessage;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class PetPackageFurniWidgetHandler implements IRoomWidgetHandler, IPetImageListener, IPetDataListener, IGetImageListener
   {
       
      
      private var var_737:Boolean = false;
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var _objectId:int = -1;
      
      private var var_630:String = "";
      
      private var var_1377:int = -1;
      
      public function PetPackageFurniWidgetHandler()
      {
         super();
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_453;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         this._container = param1;
      }
      
      public function getWidgetMessages() : Array
      {
         return [RoomWidgetOpenPetPackageMessage.const_848];
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc2_:* = null;
         switch(param1.type)
         {
            case RoomWidgetOpenPetPackageMessage.const_848:
               _loc2_ = param1 as RoomWidgetOpenPetPackageMessage;
               if(this._container != null && this._container.roomSession != null)
               {
                  this._container.roomSession.sendOpenPetPackageMessage(_loc2_.objectId,_loc2_.name);
               }
         }
         return null;
      }
      
      public function getProcessedEvents() : Array
      {
         return [RoomSessionPetPackageEvent.const_459,RoomSessionPetPackageEvent.const_544];
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = undefined;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         if(param1 == null)
         {
            return;
         }
         if(this._container != null && this._container.events != null && param1 != null)
         {
            switch(param1.type)
            {
               case RoomSessionPetPackageEvent.const_459:
                  _loc2_ = param1 as RoomSessionPetPackageEvent;
                  this._objectId = _loc2_.objectId;
                  this.var_630 = _loc2_.figure;
                  this.var_1377 = this.getPetType(this.var_630);
                  _loc4_ = this._container.avatarRenderManager.petDataManager.getPetData(this.var_1377,this);
                  _loc5_ = this.getPetImage(this.var_630);
                  _loc3_ = new RoomWidgetPetPackageUpdateEvent(RoomWidgetPetPackageUpdateEvent.const_426,this._objectId,_loc5_,-1);
                  this._container.events.dispatchEvent(_loc3_);
                  break;
               case RoomSessionPetPackageEvent.const_544:
                  _loc2_ = param1 as RoomSessionPetPackageEvent;
                  this._objectId = _loc2_.objectId;
                  _loc6_ = _loc2_.nameValidationStatus;
                  _loc3_ = new RoomWidgetPetPackageUpdateEvent(RoomWidgetPetPackageUpdateEvent.const_480,this._objectId,null,_loc6_);
                  this._container.events.dispatchEvent(_loc3_);
            }
         }
      }
      
      public function update() : void
      {
      }
      
      public function dispose() : void
      {
         this.var_737 = true;
         this._container = null;
         this._objectId = -1;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_737;
      }
      
      public function petImageReady(param1:String) : void
      {
         var _loc2_:BitmapData = this.getPetImage(param1);
         var _loc3_:RoomWidgetPetPackageUpdateEvent = new RoomWidgetPetPackageUpdateEvent(RoomWidgetPetPackageUpdateEvent.const_366,this._objectId,_loc2_,-1);
         this._container.events.dispatchEvent(_loc3_);
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         var _loc3_:RoomWidgetPetPackageUpdateEvent = new RoomWidgetPetPackageUpdateEvent(RoomWidgetPetPackageUpdateEvent.const_366,this._objectId,param2,-1);
         this._container.events.dispatchEvent(_loc3_);
      }
      
      public function petDataReady() : void
      {
         this.petImageReady(this.var_630);
      }
      
      private function getPetImage(param1:String) : BitmapData
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc2_:int = this.getPetType(param1);
         var _loc3_:int = this.getPetRace(param1);
         if(_loc2_ < 8)
         {
            _loc4_ = this._container.avatarRenderManager.createPetImageFromFigure(param1,AvatarScaleType.const_54,this);
            if(_loc4_ != null)
            {
               return _loc4_.getCroppedImage(AvatarSetType.const_34);
            }
         }
         else
         {
            _loc5_ = 0;
            _loc6_ = this._container.roomEngine.getPetImage(_loc2_,_loc3_,new Vector3d(90),64,this,_loc5_);
            if(_loc6_ != null)
            {
               return _loc6_.data;
            }
         }
         return null;
      }
      
      private function getPetType(param1:String) : int
      {
         var _loc3_:* = null;
         var _loc2_:int = -1;
         if(param1 != null)
         {
            _loc3_ = param1.split(" ");
            if(_loc3_.length >= 2)
            {
               _loc2_ = int(_loc3_[0]);
            }
         }
         return _loc2_;
      }
      
      private function getPetRace(param1:String) : int
      {
         var _loc3_:* = null;
         var _loc2_:int = -1;
         if(param1 != null)
         {
            _loc3_ = param1.split(" ");
            if(_loc3_.length >= 2)
            {
               _loc2_ = int(_loc3_[1]);
            }
         }
         return _loc2_;
      }
   }
}
