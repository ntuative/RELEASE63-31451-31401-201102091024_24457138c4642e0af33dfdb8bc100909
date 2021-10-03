package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1664:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_190:MsgWithRequestId;
      
      private var var_554:RoomEventData;
      
      private var var_2215:Boolean;
      
      private var var_2220:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      private var var_2159:int;
      
      private var var_233:GuestRoomData;
      
      private var var_834:PublicRoomShortData;
      
      private var var_2216:int;
      
      private var var_2217:Boolean;
      
      private var var_2212:int;
      
      private var var_2214:Boolean;
      
      private var var_1587:int;
      
      private var var_2219:Boolean;
      
      private var var_1290:Array;
      
      private var var_1292:Array;
      
      private var var_2211:int;
      
      private var var_1291:int;
      
      private var _favouriteIds:Dictionary;
      
      private var var_1030:Boolean;
      
      private var var_2221:int;
      
      private var var_2213:Boolean;
      
      private var var_2218:int = 0;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         this.var_1290 = new Array();
         this.var_1292 = new Array();
         this._favouriteIds = new Dictionary();
         super();
         this._navigator = param1;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return this.var_233 != null && !this._currentRoomOwner;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return this.var_233 != null && this._currentRoomOwner;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         this.var_834 = null;
         this.var_233 = null;
         this._currentRoomOwner = false;
         if(param1.guestRoom)
         {
            this._currentRoomOwner = param1.owner;
         }
         else
         {
            this.var_834 = param1.publicSpace;
            this.var_554 = null;
         }
      }
      
      public function onRoomExit() : void
      {
         if(this.var_554 != null)
         {
            this.var_554.dispose();
            this.var_554 = null;
         }
         if(this.var_834 != null)
         {
            this.var_834.dispose();
            this.var_834 = null;
         }
         if(this.var_233 != null)
         {
            this.var_233.dispose();
            this.var_233 = null;
         }
         this._currentRoomOwner = false;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(this.var_233 != null)
         {
            this.var_233.dispose();
         }
         this.var_233 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(this.var_554 != null)
         {
            this.var_554.dispose();
         }
         this.var_554 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return this.var_190 != null && this.var_190 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return this.var_190 != null && this.var_190 as GuestRoomSearchResultData != null;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return this.var_190 != null && this.var_190 as OfficialRoomsData != null;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         this.disposeCurrentMsg();
         this.var_190 = param1;
         this.var_1030 = false;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         this.disposeCurrentMsg();
         this.var_190 = param1;
         this.var_1030 = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         this.disposeCurrentMsg();
         this.var_190 = param1;
         this.var_1030 = false;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(this.var_190 == null)
         {
            return;
         }
         this.var_190.dispose();
         this.var_190 = null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return this.var_190 as GuestRoomSearchResultData;
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return this.var_190 as PopularRoomTagsData;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return this.var_190 as OfficialRoomsData;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return this.var_554;
      }
      
      public function get avatarId() : int
      {
         return this.var_2159;
      }
      
      public function get eventMod() : Boolean
      {
         return this.var_2215;
      }
      
      public function get method_3() : Boolean
      {
         return this.var_2220;
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return this._currentRoomOwner;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return this.var_233;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return this.var_834;
      }
      
      public function get hcMember() : Boolean
      {
         return this.var_2217;
      }
      
      public function get createdFlatId() : int
      {
         return this.var_2212;
      }
      
      public function get homeRoomId() : int
      {
         return this.var_1587;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return this.var_2214;
      }
      
      public function get currentRoomRating() : int
      {
         return this.var_2221;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return this.var_2216;
      }
      
      public function get settingsReceived() : Boolean
      {
         return this.var_2219;
      }
      
      public function get adIndex() : int
      {
         return this.var_2218;
      }
      
      public function get currentRoomIsStaffPick() : Boolean
      {
         return this.var_2213;
      }
      
      public function set avatarId(param1:int) : void
      {
         this.var_2159 = param1;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         this.var_2212 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         this.var_2217 = param1;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         this.var_2215 = param1;
      }
      
      public function set method_3(param1:Boolean) : void
      {
         this.var_2220 = param1;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         this.var_2214 = param1;
      }
      
      public function set homeRoomId(param1:int) : void
      {
         this.var_1587 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         this.var_2221 = param1;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         this.var_2216 = param1;
      }
      
      public function set settingsReceived(param1:Boolean) : void
      {
         this.var_2219 = param1;
      }
      
      public function set adIndex(param1:int) : void
      {
         this.var_2218 = param1;
      }
      
      public function set currentRoomIsStaffPick(param1:Boolean) : void
      {
         this.var_2213 = param1;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         this.var_1290 = param1;
         this.var_1292 = new Array();
         for each(_loc2_ in this.var_1290)
         {
            if(_loc2_.visible)
            {
               this.var_1292.push(_loc2_);
            }
         }
      }
      
      public function get allCategories() : Array
      {
         return this.var_1290;
      }
      
      public function get visibleCategories() : Array
      {
         return this.var_1292;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2211 = param1.limit;
         this.var_1291 = param1.favouriteRoomIds.length;
         this._favouriteIds = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this._favouriteIds[_loc2_] = "yes";
         }
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         this._favouriteIds[param1] = !!param2 ? "yes" : null;
         this.var_1291 += !!param2 ? 1 : -1;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = this.var_233.flatId;
         return this._favouriteIds[_loc1_] != null;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(this.var_233 == null)
         {
            return false;
         }
         var _loc1_:int = this.var_233.flatId;
         return this.var_1587 == _loc1_;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return this._favouriteIds[param1] != null;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return this.var_1291 >= this.var_2211;
      }
      
      public function startLoading() : void
      {
         this.var_1030 = true;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_1030;
      }
   }
}
