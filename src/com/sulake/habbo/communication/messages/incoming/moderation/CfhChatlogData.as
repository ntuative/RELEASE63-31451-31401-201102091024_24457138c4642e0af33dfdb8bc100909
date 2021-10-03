package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1914:int;
      
      private var var_2707:int;
      
      private var var_1285:int;
      
      private var var_2541:int;
      
      private var var_114:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1914 = param1.readInteger();
         this.var_2707 = param1.readInteger();
         this.var_1285 = param1.readInteger();
         this.var_2541 = param1.readInteger();
         this.var_114 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1914);
      }
      
      public function get callId() : int
      {
         return this.var_1914;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2707;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1285;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2541;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_114;
      }
   }
}
