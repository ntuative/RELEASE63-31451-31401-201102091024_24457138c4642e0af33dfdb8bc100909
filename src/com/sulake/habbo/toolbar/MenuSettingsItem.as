package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_2391:String;
      
      private var var_2545:Array;
      
      private var var_2546:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         this.var_2391 = param1;
         this.var_2545 = param2;
         this.var_2546 = param3;
      }
      
      public function get menuId() : String
      {
         return this.var_2391;
      }
      
      public function get yieldList() : Array
      {
         return this.var_2545;
      }
      
      public function get lockToIcon() : Boolean
      {
         return this.var_2546;
      }
   }
}
