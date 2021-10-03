package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboAchievementShareIdMessageParser implements IMessageParser
   {
       
      
      private var var_2305:String = "";
      
      private var var_2583:String = "";
      
      public function HabboAchievementShareIdMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2305 = param1.readString();
         this.var_2583 = param1.readString();
         return true;
      }
      
      public function get badgeID() : String
      {
         return this.var_2305;
      }
      
      public function get shareID() : String
      {
         return this.var_2583;
      }
   }
}
