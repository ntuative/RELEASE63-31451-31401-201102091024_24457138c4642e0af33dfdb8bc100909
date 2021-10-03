package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_2310:int;
      
      private var var_2372:int;
      
      private var var_2373:int;
      
      private var _dayOffsets:Array;
      
      private var var_1714:Array;
      
      private var var_1713:Array;
      
      private var var_2375:int;
      
      private var var_2374:int;
      
      public function MarketplaceItemStatsParser()
      {
         super();
      }
      
      public function get averagePrice() : int
      {
         return this.var_2310;
      }
      
      public function get offerCount() : int
      {
         return this.var_2372;
      }
      
      public function get historyLength() : int
      {
         return this.var_2373;
      }
      
      public function get dayOffsets() : Array
      {
         return this._dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return this.var_1714;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_1713;
      }
      
      public function get furniTypeId() : int
      {
         return this.var_2375;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_2374;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2310 = param1.readInteger();
         this.var_2372 = param1.readInteger();
         this.var_2373 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this._dayOffsets = [];
         this.var_1714 = [];
         this.var_1713 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this._dayOffsets.push(param1.readInteger());
            this.var_1714.push(param1.readInteger());
            this.var_1713.push(param1.readInteger());
            _loc3_++;
         }
         this.var_2374 = param1.readInteger();
         this.var_2375 = param1.readInteger();
         return true;
      }
   }
}
