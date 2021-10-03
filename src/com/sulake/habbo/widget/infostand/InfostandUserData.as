package com.sulake.habbo.widget.infostand
{
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   
   public class InfostandUserData
   {
       
      
      private var _userId:int = 0;
      
      private var _userName:String = "";
      
      private var var_237:Array;
      
      private var var_1671:Array;
      
      private var var_1353:int = 0;
      
      private var var_2371:String = "";
      
      private var var_1206:int = 0;
      
      private var var_2370:int = 0;
      
      private var var_2369:int = 0;
      
      private var _type:String;
      
      private var var_781:int = 0;
      
      public function InfostandUserData()
      {
         this.var_237 = [];
         this.var_1671 = [];
         super();
      }
      
      public function set userId(param1:int) : void
      {
         this._userId = param1;
      }
      
      public function set userName(param1:String) : void
      {
         this._userName = param1;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_237 = param1;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_1353 = param1;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2371 = param1;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this.var_1206 = param1;
      }
      
      public function set carryItem(param1:int) : void
      {
         this.var_2370 = param1;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2369 = param1;
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      public function set petRespectLeft(param1:int) : void
      {
         this.var_781 = param1;
      }
      
      public function set givableBadges(param1:Array) : void
      {
         this.var_1671 = param1;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get badges() : Array
      {
         return this.var_237.slice();
      }
      
      public function get groupId() : int
      {
         return this.var_1353;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2371;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1206;
      }
      
      public function get carryItem() : int
      {
         return this.var_2370;
      }
      
      public function get userRoomId() : int
      {
         return this.var_2369;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_781;
      }
      
      public function get givableBadges() : Array
      {
         return this.var_1671;
      }
      
      public function isBot() : Boolean
      {
         return this.type == RoomWidgetUserInfoUpdateEvent.BOT;
      }
      
      public function setData(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         this.userId = param1.webID;
         this.userName = param1.name;
         this.badges = param1.badges;
         this.givableBadges = param1.givableBadges;
         this.groupId = param1.groupId;
         this.groupBadgeId = param1.groupBadgeId;
         this.respectLeft = param1.respectLeft;
         this.carryItem = param1.carryItem;
         this.userRoomId = param1.userRoomId;
         this.type = param1.type;
      }
   }
}
