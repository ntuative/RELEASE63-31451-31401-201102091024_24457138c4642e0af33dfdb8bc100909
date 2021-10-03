package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LatencyPingReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_2209:int;
      
      private var var_2208:int;
      
      private var var_2210:int;
      
      public function LatencyPingReportMessageComposer(param1:int, param2:int, param3:int)
      {
         super();
         this.var_2209 = param1;
         this.var_2208 = param2;
         this.var_2210 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2209,this.var_2208,this.var_2210];
      }
      
      public function dispose() : void
      {
      }
   }
}
