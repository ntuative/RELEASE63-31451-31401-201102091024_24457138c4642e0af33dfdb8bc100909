package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_80:String = "i";
      
      public static const const_86:String = "s";
      
      public static const const_237:String = "e";
       
      
      private var var_1660:String;
      
      private var var_2530:int;
      
      private var var_1324:String;
      
      private var var_1325:int;
      
      private var var_1657:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1660 = param1.readString();
         this.var_2530 = param1.readInteger();
         this.var_1324 = param1.readString();
         this.var_1325 = param1.readInteger();
         this.var_1657 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1660;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2530;
      }
      
      public function get extraParam() : String
      {
         return this.var_1324;
      }
      
      public function get productCount() : int
      {
         return this.var_1325;
      }
      
      public function get expiration() : int
      {
         return this.var_1657;
      }
   }
}
