package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1459:Boolean;
      
      private var var_2083:int;
      
      private var var_1523:int;
      
      private var var_1524:int;
      
      private var var_2086:int;
      
      private var var_2089:int;
      
      private var var_2088:int;
      
      private var var_2085:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1459;
      }
      
      public function get commission() : int
      {
         return this.var_2083;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1523;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1524;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2089;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2086;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2088;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2085;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1459 = param1.readBoolean();
         this.var_2083 = param1.readInteger();
         this.var_1523 = param1.readInteger();
         this.var_1524 = param1.readInteger();
         this.var_2089 = param1.readInteger();
         this.var_2086 = param1.readInteger();
         this.var_2088 = param1.readInteger();
         this.var_2085 = param1.readInteger();
         return true;
      }
   }
}
