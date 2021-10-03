package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2559:Number;
      
      private var var_1525:Number;
      
      private var var_919:Number;
      
      private var var_918:Number = 0;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         this.var_2559 = param1;
         this.var_1525 = param2;
      }
      
      public function reset(param1:int) : void
      {
         this.var_919 = param1;
         this.var_918 = 0;
      }
      
      public function update() : void
      {
         this.var_919 += this.var_1525;
         this.var_918 += this.var_919;
         if(this.var_918 > 0)
         {
            this.var_918 = 0;
            this.var_919 = this.var_2559 * -1 * this.var_919;
         }
      }
      
      public function get location() : Number
      {
         return this.var_918;
      }
   }
}
