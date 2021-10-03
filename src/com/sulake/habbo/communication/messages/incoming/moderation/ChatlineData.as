package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_2429:int;
      
      private var var_2431:int;
      
      private var var_2430:int;
      
      private var var_2432:String;
      
      private var var_1725:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2429 = param1.readInteger();
         this.var_2431 = param1.readInteger();
         this.var_2430 = param1.readInteger();
         this.var_2432 = param1.readString();
         this.var_1725 = param1.readString();
      }
      
      public function get hour() : int
      {
         return this.var_2429;
      }
      
      public function get minute() : int
      {
         return this.var_2431;
      }
      
      public function get chatterId() : int
      {
         return this.var_2430;
      }
      
      public function get chatterName() : String
      {
         return this.var_2432;
      }
      
      public function get msg() : String
      {
         return this.var_1725;
      }
   }
}
