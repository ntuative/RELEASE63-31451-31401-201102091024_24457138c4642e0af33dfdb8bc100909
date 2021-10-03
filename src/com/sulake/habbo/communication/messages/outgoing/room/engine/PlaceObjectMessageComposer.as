package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   
   public class PlaceObjectMessageComposer implements IMessageComposer
   {
       
      
      private var _objectId:int;
      
      private var var_2100:int;
      
      private var var_2303:String;
      
      private var _x:int = 0;
      
      private var var_168:int = 0;
      
      private var var_261:int = 0;
      
      private var _roomId:int;
      
      private var _roomCategory:int;
      
      public function PlaceObjectMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int = 0, param8:int = 0)
      {
         super();
         this._objectId = param1;
         this.var_2100 = param2;
         this.var_2303 = param3;
         this._x = param4;
         this.var_168 = param5;
         this.var_261 = param6;
         this._roomId = param7;
         this._roomCategory = param8;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         switch(this.var_2100)
         {
            case RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE:
               return [this._objectId + " " + this._x + " " + this.var_168 + " " + this.var_261];
            case RoomObjectCategoryEnum.const_27:
               return [this._objectId + " " + this.var_2303];
            default:
               return [];
         }
      }
   }
}
