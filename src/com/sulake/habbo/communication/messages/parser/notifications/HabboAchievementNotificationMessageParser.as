package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboAchievementNotificationMessageParser implements IMessageParser
   {
       
      
      private var _type:int;
      
      private var var_1293:int;
      
      private var var_1661:int;
      
      private var var_2231:int;
      
      private var var_1588:int;
      
      private var var_1294:int;
      
      private var var_2305:String = "";
      
      private var var_2304:String = "";
      
      private var var_2306:int;
      
      public function HabboAchievementNotificationMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._type = param1.readInteger();
         this.var_1293 = param1.readInteger();
         this.var_2305 = param1.readString();
         this.var_1661 = param1.readInteger();
         this.var_2231 = param1.readInteger();
         this.var_1588 = param1.readInteger();
         this.var_1294 = param1.readInteger();
         this.var_2306 = param1.readInteger();
         this.var_2304 = param1.readString();
         return true;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1293;
      }
      
      public function get points() : int
      {
         return this.var_1661;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2231;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1588;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_1294;
      }
      
      public function get badgeID() : String
      {
         return this.var_2305;
      }
      
      public function get achievementID() : int
      {
         return this.var_2306;
      }
      
      public function get removedBadgeID() : String
      {
         return this.var_2304;
      }
   }
}
