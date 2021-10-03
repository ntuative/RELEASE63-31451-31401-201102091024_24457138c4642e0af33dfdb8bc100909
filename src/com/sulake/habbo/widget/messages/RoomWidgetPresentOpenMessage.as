package com.sulake.habbo.widget.messages
{
   public class RoomWidgetPresentOpenMessage extends RoomWidgetMessage
   {
      
      public static const const_153:String = "RWPOM_OPEN_PRESENT";
       
      
      private var _objectId:int;
      
      public function RoomWidgetPresentOpenMessage(param1:String, param2:int)
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
