package com.sulake.habbo.widget.infostand
{
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import flash.display.BitmapData;
   
   public class InfoStandPetData
   {
       
      
      private var var_1293:int;
      
      private var var_2028:int;
      
      private var var_2030:int;
      
      private var var_2034:int;
      
      private var _energy:int;
      
      private var var_2031:int;
      
      private var _nutrition:int;
      
      private var var_2033:int;
      
      private var _petRespect:int;
      
      private var _name:String = "";
      
      private var var_1601:int = -1;
      
      private var _type:int;
      
      private var var_2027:int;
      
      private var var_43:BitmapData;
      
      private var var_2032:Boolean;
      
      private var var_2007:int;
      
      private var _ownerName:String;
      
      private var _canOwnerBeKicked:Boolean;
      
      private var var_2029:int;
      
      private var var_448:int;
      
      public function InfoStandPetData()
      {
         super();
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get id() : int
      {
         return this.var_1601;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get race() : int
      {
         return this.var_2027;
      }
      
      public function get image() : BitmapData
      {
         return this.var_43;
      }
      
      public function get isOwnPet() : Boolean
      {
         return this.var_2032;
      }
      
      public function get ownerId() : int
      {
         return this.var_2007;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get canOwnerBeKicked() : Boolean
      {
         return this._canOwnerBeKicked;
      }
      
      public function get age() : int
      {
         return this.var_448;
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
      
      public function get petRespect() : int
      {
         return this._petRespect;
      }
      
      public function get roomIndex() : int
      {
         return this.var_2029;
      }
      
      public function setData(param1:RoomWidgetPetInfoUpdateEvent) : void
      {
         this._name = param1.name;
         this.var_1601 = param1.id;
         this._type = param1.petType;
         this.var_2027 = param1.petRace;
         this.var_43 = param1.image;
         this.var_2032 = param1.isOwnPet;
         this.var_2007 = param1.ownerId;
         this._ownerName = param1.ownerName;
         this._canOwnerBeKicked = param1.canOwnerBeKicked;
         this.var_1293 = param1.level;
         this.var_2028 = param1.levelMax;
         this.var_2030 = param1.experience;
         this.var_2034 = param1.experienceMax;
         this._energy = param1.energy;
         this.var_2031 = param1.energyMax;
         this._nutrition = param1.nutrition;
         this.var_2033 = param1.nutritionMax;
         this._petRespect = param1.petRespect;
         this.var_2029 = param1.roomIndex;
         this.var_448 = param1.age;
      }
   }
}
