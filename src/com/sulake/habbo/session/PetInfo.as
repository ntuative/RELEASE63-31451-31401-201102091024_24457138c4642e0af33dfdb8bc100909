package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1601:int;
      
      private var var_1293:int;
      
      private var var_2028:int;
      
      private var var_2030:int;
      
      private var var_2034:int;
      
      private var _energy:int;
      
      private var var_2031:int;
      
      private var _nutrition:int;
      
      private var var_2033:int;
      
      private var var_2007:int;
      
      private var _ownerName:String;
      
      private var var_2325:int;
      
      private var var_448:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1601;
      }
      
      public function get level() : int
      {
         return this.var_1293;
      }
      
      public function get levelMax() : int
      {
         return this.var_2028;
      }
      
      public function get experience() : int
      {
         return this.var_2030;
      }
      
      public function get experienceMax() : int
      {
         return this.var_2034;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get energyMax() : int
      {
         return this.var_2031;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get nutritionMax() : int
      {
         return this.var_2033;
      }
      
      public function get ownerId() : int
      {
         return this.var_2007;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get respect() : int
      {
         return this.var_2325;
      }
      
      public function get age() : int
      {
         return this.var_448;
      }
      
      public function set petId(param1:int) : void
      {
         this.var_1601 = param1;
      }
      
      public function set level(param1:int) : void
      {
         this.var_1293 = param1;
      }
      
      public function set levelMax(param1:int) : void
      {
         this.var_2028 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         this.var_2030 = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         this.var_2034 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         this._energy = param1;
      }
      
      public function set energyMax(param1:int) : void
      {
         this.var_2031 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         this._nutrition = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         this.var_2033 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         this.var_2007 = param1;
      }
      
      public function set ownerName(param1:String) : void
      {
         this._ownerName = param1;
      }
      
      public function set respect(param1:int) : void
      {
         this.var_2325 = param1;
      }
      
      public function set age(param1:int) : void
      {
         this.var_448 = param1;
      }
   }
}
