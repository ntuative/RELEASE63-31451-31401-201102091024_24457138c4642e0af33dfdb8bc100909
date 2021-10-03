package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_361:int;
      
      private var var_2006:int;
      
      private var var_2005:Boolean;
      
      private var var_2007:int;
      
      private var _ownerName:String;
      
      private var var_114:RoomData;
      
      private var var_744:RoomData;
      
      private var _disposed:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         this.var_361 = param1.readInteger();
         this.var_2006 = param1.readInteger();
         this.var_2005 = param1.readBoolean();
         this.var_2007 = param1.readInteger();
         this._ownerName = param1.readString();
         this.var_114 = new RoomData(param1);
         this.var_744 = new RoomData(param1);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_114 != null)
         {
            this.var_114.dispose();
            this.var_114 = null;
         }
         if(this.var_744 != null)
         {
            this.var_744.dispose();
            this.var_744 = null;
         }
      }
      
      public function get flatId() : int
      {
         return this.var_361;
      }
      
      public function get userCount() : int
      {
         return this.var_2006;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return this.var_2005;
      }
      
      public function get ownerId() : int
      {
         return this.var_2007;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get room() : RoomData
      {
         return this.var_114;
      }
      
      public function get event() : RoomData
      {
         return this.var_744;
      }
   }
}
