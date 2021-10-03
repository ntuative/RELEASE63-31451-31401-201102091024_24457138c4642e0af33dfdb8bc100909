package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_265:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2614:int = 0;
      
      private var var_2616:int = 0;
      
      private var var_2615:int = 0;
      
      private var var_2613:Boolean = false;
      
      private var var_2399:int;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_265,param6,param7);
         this.var_2614 = param1;
         this.var_2616 = param2;
         this.var_2615 = param3;
         this.var_2613 = param4;
         this.var_2399 = param5;
      }
      
      public function get daysLeft() : int
      {
         return this.var_2614;
      }
      
      public function get periodsLeft() : int
      {
         return this.var_2616;
      }
      
      public function get pastPeriods() : int
      {
         return this.var_2615;
      }
      
      public function get allowClubDances() : Boolean
      {
         return this.var_2613;
      }
      
      public function get clubLevel() : int
      {
         return this.var_2399;
      }
   }
}
