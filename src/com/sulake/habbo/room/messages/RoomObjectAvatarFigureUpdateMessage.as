package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_630:String;
      
      private var var_2027:String;
      
      private var var_964:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         this.var_630 = param1;
         this.var_964 = param2;
         this.var_2027 = param3;
      }
      
      public function get figure() : String
      {
         return this.var_630;
      }
      
      public function get race() : String
      {
         return this.var_2027;
      }
      
      public function get gender() : String
      {
         return this.var_964;
      }
   }
}
