package com.sulake.habbo.widget.messages
{
   public class RoomWidgetCreditFurniRedeemMessage extends RoomWidgetMessage
   {
      
      public static const const_890:String = "RWFCRM_REDEEM";
       
      
      private var _objectId:int;
      
      public function RoomWidgetCreditFurniRedeemMessage(param1:String, param2:int)
      {
         super(param1);
         this._objectId = param2;
      }
      
      public function get objectId() : int
      {
         return this._objectId;
      }
   }
}
