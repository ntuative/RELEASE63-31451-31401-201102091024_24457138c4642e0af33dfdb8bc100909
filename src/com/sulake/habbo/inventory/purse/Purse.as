package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1666:int = 0;
      
      private var var_1667:int = 0;
      
      private var var_2107:int = 0;
      
      private var var_2109:Boolean = false;
      
      private var var_2108:Boolean = false;
      
      public function Purse()
      {
         super();
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1666 = Math.max(0,param1);
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1667 = Math.max(0,param1);
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         this.var_2107 = Math.max(0,param1);
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         this.var_2109 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2108 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1666;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1667;
      }
      
      public function get clubPastPeriods() : int
      {
         return this.var_2107;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return this.var_2109;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2108;
      }
   }
}
