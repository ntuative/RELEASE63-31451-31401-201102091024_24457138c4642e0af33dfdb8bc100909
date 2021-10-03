package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_2310:int;
      
      private var var_2372:int;
      
      private var var_2373:int;
      
      private var _dayOffsets:Array;
      
      private var var_1714:Array;
      
      private var var_1713:Array;
      
      private var var_2375:int;
      
      private var var_2374:int;
      
      public function MarketplaceItemStats()
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
      
      public function set averagePrice(param1:int) : void
      {
         this.var_2310 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_2372 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         this.var_2373 = param1;
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         this._dayOffsets = param1.slice();
      }
      
      public function set averagePrices(param1:Array) : void
      {
         this.var_1714 = param1.slice();
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         this.var_1713 = param1.slice();
      }
      
      public function set furniTypeId(param1:int) : void
      {
         this.var_2375 = param1;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         this.var_2374 = param1;
      }
   }
}
