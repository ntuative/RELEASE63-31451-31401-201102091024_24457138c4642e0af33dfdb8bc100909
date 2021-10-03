package com.sulake.habbo.inventory.items
{
   public class WallItem implements IItem
   {
       
      
      protected var _id:int;
      
      protected var _type:int;
      
      protected var _ref:int;
      
      protected var _category:int;
      
      protected var var_1378:Number;
      
      protected var var_1968:String;
      
      protected var var_2729:Boolean;
      
      protected var var_2728:Boolean;
      
      protected var var_2657:Boolean;
      
      protected var var_2730:Boolean;
      
      protected var var_925:Boolean;
      
      public function WallItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number)
      {
         super();
         this._id = param1;
         this._type = param2;
         this._ref = param3;
         this._category = param4;
         this.var_2657 = param5;
         this.var_2728 = param6;
         this.var_2729 = param7;
         this.var_2730 = param8;
         this.var_1968 = param9;
         this.var_1378 = param10;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get ref() : int
      {
         return this._ref;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get extra() : Number
      {
         return this.var_1378;
      }
      
      public function get stuffData() : String
      {
         return this.var_1968;
      }
      
      public function set stuffData(param1:String) : void
      {
         this.var_1968 = param1;
      }
      
      public function get recyclable() : Boolean
      {
         return this.var_2729;
      }
      
      public function get tradeable() : Boolean
      {
         return this.var_2728;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2657;
      }
      
      public function get sellable() : Boolean
      {
         return this.var_2730;
      }
      
      public function get locked() : Boolean
      {
         return this.var_925;
      }
      
      public function set locked(param1:Boolean) : void
      {
         this.var_925 = param1;
      }
   }
}
