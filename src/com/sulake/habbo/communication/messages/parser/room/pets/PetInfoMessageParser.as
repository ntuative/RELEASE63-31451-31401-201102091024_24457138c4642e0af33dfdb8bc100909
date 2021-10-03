package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1601:int;
      
      private var _name:String;
      
      private var var_1293:int;
      
      private var var_2491:int;
      
      private var var_2030:int;
      
      private var _energy:int;
      
      private var _nutrition:int;
      
      private var var_630:String;
      
      private var var_2494:int;
      
      private var var_2493:int;
      
      private var var_2492:int;
      
      private var var_2325:int;
      
      private var var_2007:int;
      
      private var _ownerName:String;
      
      private var var_448:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1601;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : int
      {
         return this.var_1293;
      }
      
      public function get maxLevel() : int
      {
         return this.var_2491;
      }
      
      public function get experience() : int
      {
         return this.var_2030;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get figure() : String
      {
         return this.var_630;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_2494;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_2493;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_2492;
      }
      
      public function get respect() : int
      {
         return this.var_2325;
      }
      
      public function get ownerId() : int
      {
         return this.var_2007;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get age() : int
      {
         return this.var_448;
      }
      
      public function flush() : Boolean
      {
         this.var_1601 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1601 = param1.readInteger();
         this._name = param1.readString();
         this.var_1293 = param1.readInteger();
         this.var_2491 = param1.readInteger();
         this.var_2030 = param1.readInteger();
         this.var_2494 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_2493 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_2492 = param1.readInteger();
         this.var_630 = param1.readString();
         this.var_2325 = param1.readInteger();
         this.var_2007 = param1.readInteger();
         this.var_448 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
   }
}
