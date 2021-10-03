package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_538:int = 0;
      
      public static const const_194:int = 1;
      
      public static const const_109:int = 2;
      
      public static const const_789:Array = ["open","closed","password"];
       
      
      private var _roomId:int;
      
      private var _name:String;
      
      private var var_1577:String;
      
      private var var_2223:int;
      
      private var var_1460:int;
      
      private var var_2498:int;
      
      private var var_2625:int;
      
      private var var_793:Array;
      
      private var var_2495:Array;
      
      private var var_2626:int;
      
      private var var_2257:Boolean;
      
      private var var_2496:Boolean;
      
      private var var_2499:Boolean;
      
      private var var_2497:Boolean;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2257;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         this.var_2257 = param1;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return this.var_2496;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         this.var_2496 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return this.var_2499;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         this.var_2499 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return this.var_2497;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         this.var_2497 = param1;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function set roomId(param1:int) : void
      {
         this._roomId = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get description() : String
      {
         return this.var_1577;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1577 = param1;
      }
      
      public function get doorMode() : int
      {
         return this.var_2223;
      }
      
      public function set doorMode(param1:int) : void
      {
         this.var_2223 = param1;
      }
      
      public function get categoryId() : int
      {
         return this.var_1460;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1460 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return this.var_2498;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         this.var_2498 = param1;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return this.var_2625;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         this.var_2625 = param1;
      }
      
      public function get tags() : Array
      {
         return this.var_793;
      }
      
      public function set tags(param1:Array) : void
      {
         this.var_793 = param1;
      }
      
      public function get controllers() : Array
      {
         return this.var_2495;
      }
      
      public function set controllers(param1:Array) : void
      {
         this.var_2495 = param1;
      }
      
      public function get controllerCount() : int
      {
         return this.var_2626;
      }
      
      public function set controllerCount(param1:int) : void
      {
         this.var_2626 = param1;
      }
   }
}
