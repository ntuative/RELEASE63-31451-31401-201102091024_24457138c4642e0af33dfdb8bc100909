package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
      
      public static const const_181:int = 0;
       
      
      private var var_2354:int = 0;
      
      private var var_1327:Dictionary;
      
      private var var_1666:int = 0;
      
      private var var_1667:int = 0;
      
      private var var_2108:Boolean = false;
      
      private var var_2352:int = 0;
      
      private var var_2353:int = 0;
      
      public function Purse()
      {
         this.var_1327 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_2354;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_2354 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1666;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1666 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1667;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1667 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_1666 > 0 || this.var_1667 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2108;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2108 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2352;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2352 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2353;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2353 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1327;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1327 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1327[param1];
      }
   }
}
