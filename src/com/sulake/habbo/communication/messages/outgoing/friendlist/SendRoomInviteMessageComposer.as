package com.sulake.habbo.communication.messages.outgoing.friendlist
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class SendRoomInviteMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_846:Array;
      
      private var var_1725:String;
      
      public function SendRoomInviteMessageComposer(param1:String)
      {
         this.var_846 = new Array();
         super();
         this.var_1725 = param1;
      }
      
      public function getMessageArray() : Array
      {
         var _loc1_:Array = new Array();
         _loc1_.push(this.var_846.length);
         var _loc2_:int = 0;
         while(_loc2_ < this.var_846.length)
         {
            _loc1_.push(this.var_846[_loc2_]);
            _loc2_++;
         }
         _loc1_.push(this.var_1725);
         return _loc1_;
      }
      
      public function addInvitedFriend(param1:int) : void
      {
         this.var_846.push(param1);
      }
      
      public function dispose() : void
      {
         this.var_846 = null;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
   }
}
