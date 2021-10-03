package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_361:int;
      
      private var var_744:Boolean;
      
      private var var_808:String;
      
      private var _ownerName:String;
      
      private var var_2223:int;
      
      private var var_2006:int;
      
      private var var_2259:int;
      
      private var var_1577:String;
      
      private var var_2256:int;
      
      private var var_2225:Boolean;
      
      private var var_667:int;
      
      private var var_1460:int;
      
      private var var_2260:String;
      
      private var var_793:Array;
      
      private var var_2258:RoomThumbnailData;
      
      private var var_2257:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_793 = new Array();
         super();
         this.var_361 = param1.readInteger();
         this.var_744 = param1.readBoolean();
         this.var_808 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2223 = param1.readInteger();
         this.var_2006 = param1.readInteger();
         this.var_2259 = param1.readInteger();
         this.var_1577 = param1.readString();
         this.var_2256 = param1.readInteger();
         this.var_2225 = param1.readBoolean();
         this.var_667 = param1.readInteger();
         this.var_1460 = param1.readInteger();
         this.var_2260 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_793.push(_loc4_);
            _loc3_++;
         }
         this.var_2258 = new RoomThumbnailData(param1);
         this.var_2257 = param1.readBoolean();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_793 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get flatId() : int
      {
         return this.var_361;
      }
      
      public function get event() : Boolean
      {
         return this.var_744;
      }
      
      public function get roomName() : String
      {
         return this.var_808;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2223;
      }
      
      public function get userCount() : int
      {
         return this.var_2006;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2259;
      }
      
      public function get description() : String
      {
         return this.var_1577;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2256;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2225;
      }
      
      public function get score() : int
      {
         return this.var_667;
      }
      
      public function get categoryId() : int
      {
         return this.var_1460;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2260;
      }
      
      public function get tags() : Array
      {
         return this.var_793;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2258;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2257;
      }
   }
}
