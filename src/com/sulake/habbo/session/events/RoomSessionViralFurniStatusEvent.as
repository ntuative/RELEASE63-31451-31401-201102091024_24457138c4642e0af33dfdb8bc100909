package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionViralFurniStatusEvent extends RoomSessionEvent
   {
      
      public static const const_488:String = "RSVFS_STATUS";
      
      public static const const_551:String = "RSVFS_RECEIVED";
       
      
      private var var_176:String;
      
      private var _objectId:int;
      
      private var var_371:int = -1;
      
      private var var_1124:String;
      
      private var var_2363:String;
      
      private var var_2367:Boolean;
      
      public function RoomSessionViralFurniStatusEvent(param1:String, param2:IRoomSession, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param2,param3,param4);
         this.var_371 = this.status;
         this.var_1124 = this.shareId;
      }
      
      public function get objectId() : int
      {
         return this._objectId;
      }
      
      public function get status() : int
      {
         return this.var_371;
      }
      
      public function get shareId() : String
      {
         return this.var_1124;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2363;
      }
      
      public function get giftWasReceived() : Boolean
      {
         return this.var_2367;
      }
      
      public function set objectId(param1:int) : void
      {
         this._objectId = param1;
      }
      
      public function set status(param1:int) : void
      {
         this.var_371 = param1;
      }
      
      public function set shareId(param1:String) : void
      {
         this.var_1124 = param1;
      }
      
      public function set firstClickUserName(param1:String) : void
      {
         this.var_2363 = param1;
      }
      
      public function set giftWasReceived(param1:Boolean) : void
      {
         this.var_2367 = param1;
      }
      
      public function get campaignID() : String
      {
         return this.var_176;
      }
      
      public function set campaignID(param1:String) : void
      {
         this.var_176 = param1;
      }
   }
}
