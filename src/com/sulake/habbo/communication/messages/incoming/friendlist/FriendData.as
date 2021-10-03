package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_964:int;
      
      private var var_736:Boolean;
      
      private var var_1802:Boolean;
      
      private var var_630:String;
      
      private var var_1460:int;
      
      private var var_1894:String;
      
      private var var_1752:String;
      
      private var var_1753:String;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_964 = param1.readInteger();
         this.var_736 = param1.readBoolean();
         this.var_1802 = param1.readBoolean();
         this.var_630 = param1.readString();
         this.var_1460 = param1.readInteger();
         this.var_1894 = param1.readString();
         this.var_1752 = param1.readString();
         this.var_1753 = param1.readString();
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_964;
      }
      
      public function get online() : Boolean
      {
         return this.var_736;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1802;
      }
      
      public function get figure() : String
      {
         return this.var_630;
      }
      
      public function get categoryId() : int
      {
         return this.var_1460;
      }
      
      public function get motto() : String
      {
         return this.var_1894;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1752;
      }
      
      public function get realName() : String
      {
         return this.var_1753;
      }
   }
}
