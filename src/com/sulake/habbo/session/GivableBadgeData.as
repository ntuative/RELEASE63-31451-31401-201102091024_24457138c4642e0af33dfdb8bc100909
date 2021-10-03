package com.sulake.habbo.session
{
   public class GivableBadgeData
   {
       
      
      private var var_286:int;
      
      private var var_2064:String;
      
      public function GivableBadgeData(param1:int, param2:String)
      {
         super();
         this.var_286 = param1;
         this.var_2064 = param2;
      }
      
      public function get badgeId() : int
      {
         return this.var_286;
      }
      
      public function get achievementTypeName() : String
      {
         return this.var_2064;
      }
   }
}
