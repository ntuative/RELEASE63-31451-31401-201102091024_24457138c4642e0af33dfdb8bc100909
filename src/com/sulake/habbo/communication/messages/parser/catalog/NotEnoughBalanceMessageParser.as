package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NotEnoughBalanceMessageParser implements IMessageParser
   {
       
      
      private var var_1881:int = 0;
      
      private var var_1880:int = 0;
      
      private var var_1697:int = 0;
      
      public function NotEnoughBalanceMessageParser()
      {
         super();
      }
      
      public function get notEnoughCredits() : int
      {
         return this.var_1881;
      }
      
      public function get notEnoughActivityPoints() : int
      {
         return this.var_1880;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1697;
      }
      
      public function flush() : Boolean
      {
         this.var_1881 = 0;
         this.var_1880 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1881 = param1.readInteger();
         this.var_1880 = param1.readInteger();
         this.var_1697 = param1.readInteger();
         return true;
      }
   }
}
