package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1143:int = 1;
      
      public static const const_632:int = 2;
      
      public static const const_885:int = 3;
      
      public static const const_1588:int = 4;
       
      
      private var _index:int;
      
      private var var_2599:String;
      
      private var var_2598:String;
      
      private var var_2600:Boolean;
      
      private var var_2596:String;
      
      private var var_836:String;
      
      private var var_2597:int;
      
      private var var_2006:int;
      
      private var _type:int;
      
      private var var_2098:String;
      
      private var var_938:GuestRoomData;
      
      private var var_939:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_2599 = param1.readString();
         this.var_2598 = param1.readString();
         this.var_2600 = param1.readInteger() == 1;
         this.var_2596 = param1.readString();
         this.var_836 = param1.readString();
         this.var_2597 = param1.readInteger();
         this.var_2006 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_1143)
         {
            this.var_2098 = param1.readString();
         }
         else if(this._type == const_885)
         {
            this.var_939 = new PublicRoomData(param1);
         }
         else if(this._type == const_632)
         {
            this.var_938 = new GuestRoomData(param1);
         }
         else
         {
            this._open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_938 != null)
         {
            this.var_938.dispose();
            this.var_938 = null;
         }
         if(this.var_939 != null)
         {
            this.var_939.dispose();
            this.var_939 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_2599;
      }
      
      public function get popupDesc() : String
      {
         return this.var_2598;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_2600;
      }
      
      public function get picText() : String
      {
         return this.var_2596;
      }
      
      public function get picRef() : String
      {
         return this.var_836;
      }
      
      public function get folderId() : int
      {
         return this.var_2597;
      }
      
      public function get tag() : String
      {
         return this.var_2098;
      }
      
      public function get userCount() : int
      {
         return this.var_2006;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_938;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_939;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_1143)
         {
            return 0;
         }
         if(this.type == const_632)
         {
            return this.var_938.maxUserCount;
         }
         if(this.type == const_885)
         {
            return this.var_939.maxUsers;
         }
         return 0;
      }
   }
}
