package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetFurniInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_608:String = "RWFIUE_FURNI";
       
      
      private var _id:int = 0;
      
      private var _category:int = 0;
      
      private var _name:String = "";
      
      private var var_1577:String = "";
      
      private var var_43:BitmapData = null;
      
      private var var_2594:Boolean = false;
      
      private var var_2595:Boolean = false;
      
      private var var_1827:Boolean = false;
      
      private var var_1828:Boolean = false;
      
      private var var_2267:Boolean = false;
      
      private var var_1657:int = -1;
      
      private var var_2323:int = -1;
      
      private var _offerId:int = -1;
      
      public function RoomWidgetFurniInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function set category(param1:int) : void
      {
         this._category = param1;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1577 = param1;
      }
      
      public function get description() : String
      {
         return this.var_1577;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_43 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_43;
      }
      
      public function set isWallItem(param1:Boolean) : void
      {
         this.var_2594 = param1;
      }
      
      public function get isWallItem() : Boolean
      {
         return this.var_2594;
      }
      
      public function set isStickie(param1:Boolean) : void
      {
         this.var_2595 = param1;
      }
      
      public function get isStickie() : Boolean
      {
         return this.var_2595;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_1827 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_1827;
      }
      
      public function set isRoomController(param1:Boolean) : void
      {
         this.var_1828 = param1;
      }
      
      public function get isRoomController() : Boolean
      {
         return this.var_1828;
      }
      
      public function set isAnyRoomController(param1:Boolean) : void
      {
         this.var_2267 = param1;
      }
      
      public function get isAnyRoomController() : Boolean
      {
         return this.var_2267;
      }
      
      public function set expiration(param1:int) : void
      {
         this.var_1657 = param1;
      }
      
      public function get expiration() : int
      {
         return this.var_1657;
      }
      
      public function set catalogPageId(param1:int) : void
      {
         this.var_2323 = param1;
      }
      
      public function get catalogPageId() : int
      {
         return this.var_2323;
      }
      
      public function set offerId(param1:int) : void
      {
         this._offerId = param1;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
   }
}
