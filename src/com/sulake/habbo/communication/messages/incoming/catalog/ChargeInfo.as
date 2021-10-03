package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChargeInfo
   {
       
      
      private var var_2604:int;
      
      private var var_2603:int;
      
      private var var_1099:int;
      
      private var var_1097:int;
      
      private var var_1697:int;
      
      private var var_2605:int;
      
      public function ChargeInfo(param1:IMessageDataWrapper)
      {
         super();
         this.var_2604 = param1.readInteger();
         this.var_2603 = param1.readInteger();
         this.var_1099 = param1.readInteger();
         this.var_1097 = param1.readInteger();
         this.var_1697 = param1.readInteger();
         this.var_2605 = param1.readInteger();
      }
      
      public function get stuffId() : int
      {
         return this.var_2604;
      }
      
      public function get charges() : int
      {
         return this.var_2603;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1099;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1097;
      }
      
      public function get chargePatchSize() : int
      {
         return this.var_2605;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1697;
      }
   }
}
