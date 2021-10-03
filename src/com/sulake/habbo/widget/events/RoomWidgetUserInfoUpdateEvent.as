package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_191:String = "RWUIUE_OWN_USER";
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_230:String = "RWUIUE_PEER";
      
      public static const const_1485:int = 0;
      
      public static const TRADE_REASON_NO_OWN_RIGHT:int = 1;
      
      public static const const_1009:int = 2;
      
      public static const const_1129:int = 3;
      
      public static const const_1520:String = "BOT";
       
      
      private var _name:String = "";
      
      private var var_1894:String = "";
      
      private var var_2180:int;
      
      private var var_2179:int = 0;
      
      private var var_2175:int = 0;
      
      private var var_630:String = "";
      
      private var var_43:BitmapData = null;
      
      private var var_237:Array;
      
      private var var_1671:Array;
      
      private var var_1353:int = 0;
      
      private var var_2371:String = "";
      
      private var var_2370:int = 0;
      
      private var var_2369:int = 0;
      
      private var var_1826:Boolean = false;
      
      private var var_1753:String = "";
      
      private var var_2551:Boolean = false;
      
      private var var_2555:Boolean = true;
      
      private var var_1206:int = 0;
      
      private var var_2548:Boolean = false;
      
      private var var_2549:Boolean = false;
      
      private var var_2550:Boolean = false;
      
      private var var_2553:Boolean = false;
      
      private var var_2552:Boolean = false;
      
      private var var_2554:Boolean = false;
      
      private var var_2547:int = 0;
      
      private var var_1827:Boolean = false;
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_237 = [];
         this.var_1671 = [];
         super(param1,param2,param3);
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1894 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1894;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2180 = param1;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2180;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2179 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2179;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2175 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2175;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_630 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_630;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_43 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_43;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_237 = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_237;
      }
      
      public function get givableBadges() : Array
      {
         return this.var_1671;
      }
      
      public function set givableBadges(param1:Array) : void
      {
         this.var_1671 = param1;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_1353 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1353;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2371 = param1;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2371;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         this.var_2551 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return this.var_2551;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this.var_1206 = param1;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1206;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         this.var_2548 = param1;
      }
      
      public function get isIgnored() : Boolean
      {
         return this.var_2548;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         this.var_2549 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return this.var_2549;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         this.var_2550 = param1;
      }
      
      public function get amIController() : Boolean
      {
         return this.var_2550;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         this.var_2553 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return this.var_2553;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         this.var_2552 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return this.var_2552;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         this.var_2554 = param1;
      }
      
      public function get canTrade() : Boolean
      {
         return this.var_2554;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         this.var_2547 = param1;
      }
      
      public function get canTradeReason() : int
      {
         return this.var_2547;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         this.var_2555 = param1;
      }
      
      public function get canBeKicked() : Boolean
      {
         return this.var_2555;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_1827 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_1827;
      }
      
      public function set carryItem(param1:int) : void
      {
         this.var_2370 = param1;
      }
      
      public function get carryItem() : int
      {
         return this.var_2370;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2369 = param1;
      }
      
      public function get userRoomId() : int
      {
         return this.var_2369;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         this.var_1826 = param1;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return this.var_1826;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1753 = param1;
      }
      
      public function get realName() : String
      {
         return this.var_1753;
      }
   }
}
