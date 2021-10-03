package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2163:String;
      
      private var var_2470:int;
      
      private var var_2162:int;
      
      private var var_2469:String;
      
      private var var_2468:int;
      
      private var var_1487:int;
      
      private var _disposed:Boolean;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2163 = param1.readString();
         this.var_2470 = param1.readInteger();
         this.var_2162 = param1.readInteger();
         this.var_2469 = param1.readString();
         this.var_2468 = param1.readInteger();
         this.var_1487 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get unitPropertySet() : String
      {
         return this.var_2163;
      }
      
      public function get unitPort() : int
      {
         return this.var_2470;
      }
      
      public function get worldId() : int
      {
         return this.var_2162;
      }
      
      public function get castLibs() : String
      {
         return this.var_2469;
      }
      
      public function get maxUsers() : int
      {
         return this.var_2468;
      }
      
      public function get nodeId() : int
      {
         return this.var_1487;
      }
   }
}
