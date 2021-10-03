package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2040:int = 0;
      
      private var var_1267:String = "";
      
      private var var_1532:String = "";
      
      private var var_2102:String = "";
      
      private var var_2149:String = "";
      
      private var var_1561:int = 0;
      
      private var var_2147:int = 0;
      
      private var var_2146:int = 0;
      
      private var var_1265:int = 0;
      
      private var var_2148:int = 0;
      
      private var var_1266:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2040 = param1;
         this.var_1267 = param2;
         this.var_1532 = param3;
         this.var_2102 = param4;
         this.var_2149 = param5;
         if(param6)
         {
            this.var_1561 = 1;
         }
         else
         {
            this.var_1561 = 0;
         }
         this.var_2147 = param7;
         this.var_2146 = param8;
         this.var_1265 = param9;
         this.var_2148 = param10;
         this.var_1266 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2040,this.var_1267,this.var_1532,this.var_2102,this.var_2149,this.var_1561,this.var_2147,this.var_2146,this.var_1265,this.var_2148,this.var_1266];
      }
   }
}
