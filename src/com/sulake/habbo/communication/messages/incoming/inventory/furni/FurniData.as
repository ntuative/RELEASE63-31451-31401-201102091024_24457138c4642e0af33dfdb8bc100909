package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_2587:int;
      
      private var var_1295:String;
      
      private var _objId:int;
      
      private var var_1835:int;
      
      private var _category:int;
      
      private var var_1968:String;
      
      private var var_2643:Boolean;
      
      private var var_2642:Boolean;
      
      private var var_2641:Boolean;
      
      private var var_2014:Boolean;
      
      private var var_2110:int;
      
      private var var_1378:int;
      
      private var var_1900:String = "";
      
      private var var_2131:int = -1;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         this.var_2587 = param1;
         this.var_1295 = param2;
         this._objId = param3;
         this.var_1835 = param4;
         this._category = param5;
         this.var_1968 = param6;
         this.var_2643 = param7;
         this.var_2642 = param8;
         this.var_2641 = param9;
         this.var_2014 = param10;
         this.var_2110 = param11;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         this.var_1900 = param1;
         this.var_1378 = param2;
      }
      
      public function get stripId() : int
      {
         return this.var_2587;
      }
      
      public function get itemType() : String
      {
         return this.var_1295;
      }
      
      public function get objId() : int
      {
         return this._objId;
      }
      
      public function get classId() : int
      {
         return this.var_1835;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_1968;
      }
      
      public function get isGroupable() : Boolean
      {
         return this.var_2643;
      }
      
      public function get isRecyclable() : Boolean
      {
         return this.var_2642;
      }
      
      public function get isTradeable() : Boolean
      {
         return this.var_2641;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2014;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2110;
      }
      
      public function get slotId() : String
      {
         return this.var_1900;
      }
      
      public function get songId() : int
      {
         return this.var_2131;
      }
      
      public function get extra() : int
      {
         return this.var_1378;
      }
   }
}
