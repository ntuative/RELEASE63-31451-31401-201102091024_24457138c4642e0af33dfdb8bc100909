package com.sulake.habbo.catalog.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOfferData implements IMarketPlaceOfferData
   {
       
      
      private var _offerId:int;
      
      private var _furniId:int;
      
      private var var_2311:int;
      
      private var var_1968:String;
      
      private var var_1631:int;
      
      private var var_2310:int;
      
      private var var_2308:int;
      
      private var var_371:int;
      
      private var var_2309:int = -1;
      
      private var var_1630:int;
      
      private var var_43:BitmapData;
      
      public function MarketPlaceOfferData(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int = -1)
      {
         super();
         this._offerId = param1;
         this._furniId = param2;
         this.var_2311 = param3;
         this.var_1968 = param4;
         this.var_1631 = param5;
         this.var_371 = param6;
         this.var_2310 = param7;
         this.var_1630 = param8;
      }
      
      public function dispose() : void
      {
         if(this.var_43)
         {
            this.var_43.dispose();
            this.var_43 = null;
         }
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniType() : int
      {
         return this.var_2311;
      }
      
      public function get stuffData() : String
      {
         return this.var_1968;
      }
      
      public function get price() : int
      {
         return this.var_1631;
      }
      
      public function get averagePrice() : int
      {
         return this.var_2310;
      }
      
      public function get image() : BitmapData
      {
         return this.var_43;
      }
      
      public function set image(param1:BitmapData) : void
      {
         if(this.var_43 != null)
         {
            this.var_43.dispose();
         }
         this.var_43 = param1;
      }
      
      public function set imageCallback(param1:int) : void
      {
         this.var_2308 = param1;
      }
      
      public function get imageCallback() : int
      {
         return this.var_2308;
      }
      
      public function get status() : int
      {
         return this.var_371;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2309;
      }
      
      public function set timeLeftMinutes(param1:int) : void
      {
         this.var_2309 = param1;
      }
      
      public function set price(param1:int) : void
      {
         this.var_1631 = param1;
      }
      
      public function set offerId(param1:int) : void
      {
         this._offerId = param1;
      }
      
      public function get offerCount() : int
      {
         return this.var_1630;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_1630 = param1;
      }
   }
}
