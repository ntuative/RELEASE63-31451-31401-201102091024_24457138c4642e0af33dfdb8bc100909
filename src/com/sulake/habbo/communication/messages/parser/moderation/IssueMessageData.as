package com.sulake.habbo.communication.messages.parser.moderation
{
   public class IssueMessageData
   {
      
      public static const const_158:int = 1;
      
      public static const const_327:int = 2;
      
      public static const const_1629:int = 3;
       
      
      private var var_2297:int;
      
      private var _state:int;
      
      private var var_1460:int;
      
      private var _reportedCategoryId:int;
      
      private var var_1737:int;
      
      private var var_2537:int;
      
      private var var_2535:int = 0;
      
      private var var_2540:int;
      
      private var var_2539:String;
      
      private var var_1285:int;
      
      private var var_1578:String;
      
      private var var_2534:int;
      
      private var var_2533:String;
      
      private var _message:String;
      
      private var var_2541:int;
      
      private var var_808:String;
      
      private var var_1552:int;
      
      private var var_2542:String;
      
      private var var_361:int;
      
      private var var_2538:String;
      
      private var var_2536:String;
      
      private var var_2470:int;
      
      private var var_2162:int;
      
      public function IssueMessageData(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:String, param9:int, param10:String, param11:int, param12:String, param13:String, param14:int, param15:String, param16:int, param17:String, param18:int, param19:String, param20:String, param21:int, param22:int)
      {
         super();
         this.var_2297 = param1;
         this._state = param2;
         this.var_1460 = param3;
         this._reportedCategoryId = param4;
         this.var_1737 = param5;
         this.var_2537 = param6;
         this.var_2540 = param7;
         this.var_2539 = param8;
         this.var_1285 = param9;
         this.var_1578 = param10;
         this.var_2534 = param11;
         this.var_2533 = param12;
         this._message = param13;
         this.var_2541 = param14;
         this.var_808 = param15;
         this.var_1552 = param16;
         this.var_2542 = param17;
         this.var_361 = param18;
         this.var_2538 = param19;
         this.var_2536 = param20;
         this.var_2470 = param21;
         this.var_2162 = param22;
      }
      
      public function get issueId() : int
      {
         return this.var_2297;
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function get categoryId() : int
      {
         return this.var_1460;
      }
      
      public function get reportedCategoryId() : int
      {
         return this._reportedCategoryId;
      }
      
      public function get timeStamp() : int
      {
         return this.var_1737;
      }
      
      public function get priority() : int
      {
         return this.var_2537 + this.var_2535;
      }
      
      public function get reporterUserId() : int
      {
         return this.var_2540;
      }
      
      public function get reporterUserName() : String
      {
         return this.var_2539;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1285;
      }
      
      public function get reportedUserName() : String
      {
         return this.var_1578;
      }
      
      public function get pickerUserId() : int
      {
         return this.var_2534;
      }
      
      public function get pickerUserName() : String
      {
         return this.var_2533;
      }
      
      public function get message() : String
      {
         return this._message;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2541;
      }
      
      public function get roomName() : String
      {
         return this.var_808;
      }
      
      public function get roomType() : int
      {
         return this.var_1552;
      }
      
      public function get flatType() : String
      {
         return this.var_2542;
      }
      
      public function get flatId() : int
      {
         return this.var_361;
      }
      
      public function get flatOwnerName() : String
      {
         return this.var_2538;
      }
      
      public function get roomResources() : String
      {
         return this.var_2536;
      }
      
      public function get unitPort() : int
      {
         return this.var_2470;
      }
      
      public function get worldId() : int
      {
         return this.var_2162;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         this.var_2535 = param1;
      }
      
      public function getOpenTime(param1:int) : String
      {
         var _loc2_:int = (param1 - this.var_1737) / 1000;
         var _loc3_:int = _loc2_ % 60;
         var _loc4_:int = _loc2_ / 60;
         var _loc5_:int = _loc4_ % 60;
         var _loc6_:int = _loc4_ / 60;
         var _loc7_:String = _loc3_ < 10 ? "0" + _loc3_ : "" + _loc3_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         var _loc9_:String = _loc6_ < 10 ? "0" + _loc6_ : "" + _loc6_;
         return _loc9_ + ":" + _loc8_ + ":" + _loc7_;
      }
   }
}
