package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionUserGivableBadgesEvent extends RoomSessionEvent
   {
      
      public static const const_65:String = "RSUBE_GIVABLE_BADGES";
       
      
      private var var_237:Array;
      
      public function RoomSessionUserGivableBadgesEvent(param1:IRoomSession, param2:Array, param3:Boolean = false, param4:Boolean = false)
      {
         this.var_237 = [];
         super(const_65,param1,param3,param4);
         this.var_237 = param2;
      }
      
      public function get badges() : Array
      {
         return this.var_237;
      }
   }
}
