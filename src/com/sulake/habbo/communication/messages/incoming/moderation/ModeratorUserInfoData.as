package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var _userId:int;
      
      private var _userName:String;
      
      private var var_2347:int;
      
      private var var_2346:int;
      
      private var var_736:Boolean;
      
      private var var_2348:int;
      
      private var var_2345:int;
      
      private var var_2350:int;
      
      private var var_2349:int;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         this._userId = param1.readInteger();
         this._userName = param1.readString();
         this.var_2347 = param1.readInteger();
         this.var_2346 = param1.readInteger();
         this.var_736 = param1.readBoolean();
         this.var_2348 = param1.readInteger();
         this.var_2345 = param1.readInteger();
         this.var_2350 = param1.readInteger();
         this.var_2349 = param1.readInteger();
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return this.var_2347;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return this.var_2346;
      }
      
      public function get online() : Boolean
      {
         return this.var_736;
      }
      
      public function get cfhCount() : int
      {
         return this.var_2348;
      }
      
      public function get abusiveCfhCount() : int
      {
         return this.var_2345;
      }
      
      public function get cautionCount() : int
      {
         return this.var_2350;
      }
      
      public function get banCount() : int
      {
         return this.var_2349;
      }
   }
}
