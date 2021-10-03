package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2071:int;
      
      private var var_1295:String;
      
      private var var_2656:int;
      
      private var var_2654:int;
      
      private var _category:int;
      
      private var var_1968:String;
      
      private var var_1378:int;
      
      private var var_2658:int;
      
      private var var_2655:int;
      
      private var var_2652:int;
      
      private var var_2653:int;
      
      private var var_2657:Boolean;
      
      private var var_2804:int;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         this.var_2071 = param1;
         this.var_1295 = param2;
         this.var_2656 = param3;
         this.var_2654 = param4;
         this._category = param5;
         this.var_1968 = param6;
         this.var_1378 = param7;
         this.var_2658 = param8;
         this.var_2655 = param9;
         this.var_2652 = param10;
         this.var_2653 = param11;
         this.var_2657 = param12;
      }
      
      public function get itemID() : int
      {
         return this.var_2071;
      }
      
      public function get itemType() : String
      {
         return this.var_1295;
      }
      
      public function get roomItemID() : int
      {
         return this.var_2656;
      }
      
      public function get itemTypeID() : int
      {
         return this.var_2654;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_1968;
      }
      
      public function get extra() : int
      {
         return this.var_1378;
      }
      
      public function get timeToExpiration() : int
      {
         return this.var_2658;
      }
      
      public function get creationDay() : int
      {
         return this.var_2655;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2652;
      }
      
      public function get creationYear() : int
      {
         return this.var_2653;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2657;
      }
      
      public function get songID() : int
      {
         return this.var_1378;
      }
   }
}
