package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_1459:Boolean = false;
      
      private var var_1631:int;
      
      private var var_1496:Array;
      
      private var var_658:Array;
      
      private var var_659:Array;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         this.var_1459 = _loc2_.isWrappingEnabled;
         this.var_1631 = _loc2_.wrappingPrice;
         this.var_1496 = _loc2_.stuffTypes;
         this.var_658 = _loc2_.boxTypes;
         this.var_659 = _loc2_.ribbonTypes;
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1459;
      }
      
      public function get price() : int
      {
         return this.var_1631;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1496;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_658;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_659;
      }
   }
}
