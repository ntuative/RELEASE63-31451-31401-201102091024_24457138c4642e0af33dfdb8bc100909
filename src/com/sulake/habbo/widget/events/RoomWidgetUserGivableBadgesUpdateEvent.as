package com.sulake.habbo.widget.events
{
   public class RoomWidgetUserGivableBadgesUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_755:String = "RWUGBUE_USER_GIVABLE_BADGES";
       
      
      private var var_237:Array;
      
      public function RoomWidgetUserGivableBadgesUpdateEvent(param1:Array, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_237 = [];
         super(const_755,param2,param3);
         this.var_237 = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_237;
      }
   }
}
