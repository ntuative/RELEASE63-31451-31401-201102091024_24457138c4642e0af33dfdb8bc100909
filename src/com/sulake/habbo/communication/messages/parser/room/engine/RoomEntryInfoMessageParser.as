package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1813:Boolean;
      
      private var var_2579:int;
      
      private var var_423:Boolean;
      
      private var var_1137:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function get guestRoom() : Boolean
      {
         return this.var_1813;
      }
      
      public function get guestRoomId() : int
      {
         return this.var_2579;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return this.var_1137;
      }
      
      public function get owner() : Boolean
      {
         return this.var_423;
      }
      
      public function flush() : Boolean
      {
         if(this.var_1137 != null)
         {
            this.var_1137.dispose();
            this.var_1137 = null;
         }
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1813 = param1.readBoolean();
         if(this.var_1813)
         {
            this.var_2579 = param1.readInteger();
            this.var_423 = param1.readBoolean();
         }
         else
         {
            this.var_1137 = new PublicRoomShortData(param1);
         }
         return true;
      }
   }
}
