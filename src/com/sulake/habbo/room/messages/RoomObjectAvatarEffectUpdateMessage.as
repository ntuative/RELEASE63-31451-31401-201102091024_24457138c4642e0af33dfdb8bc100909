package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarEffectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_178:int;
      
      private var var_2130:int;
      
      public function RoomObjectAvatarEffectUpdateMessage(param1:int = 0, param2:int = 0)
      {
         super();
         this.var_178 = param1;
         this.var_2130 = param2;
      }
      
      public function get effect() : int
      {
         return this.var_178;
      }
      
      public function get delayMilliSeconds() : int
      {
         return this.var_2130;
      }
   }
}
