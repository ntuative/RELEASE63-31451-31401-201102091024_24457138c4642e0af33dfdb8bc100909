package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2159:int;
      
      private var var_1751:String;
      
      private var var_2456:String;
      
      private var var_2460:Boolean;
      
      private var var_2458:Boolean;
      
      private var var_2461:int;
      
      private var var_2459:String;
      
      private var var_2457:String;
      
      private var var_1753:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2159 = param1.readInteger();
         this.var_1751 = param1.readString();
         this.var_2456 = param1.readString();
         this.var_2460 = param1.readBoolean();
         this.var_2458 = param1.readBoolean();
         param1.readString();
         this.var_2461 = param1.readInteger();
         this.var_2459 = param1.readString();
         this.var_2457 = param1.readString();
         this.var_1753 = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_2159;
      }
      
      public function get avatarName() : String
      {
         return this.var_1751;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2456;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2460;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2458;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2461;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2459;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2457;
      }
      
      public function get realName() : String
      {
         return this.var_1753;
      }
   }
}
