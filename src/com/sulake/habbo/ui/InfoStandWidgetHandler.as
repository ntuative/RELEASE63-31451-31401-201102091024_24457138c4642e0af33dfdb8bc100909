package com.sulake.habbo.ui
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.friendlist.IFriend;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   import com.sulake.habbo.room.object.RoomObjectOperationEnum;
   import com.sulake.habbo.room.object.RoomObjectTypeEnum;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.session.GivableBadgeData;
   import com.sulake.habbo.session.IPetInfo;
   import com.sulake.habbo.session.IUserData;
   import com.sulake.habbo.session.events.BadgeImageReadyEvent;
   import com.sulake.habbo.session.events.RoomSessionPetCommandsUpdateEvent;
   import com.sulake.habbo.session.events.RoomSessionPetInfoUpdateEvent;
   import com.sulake.habbo.session.events.RoomSessionUserBadgesEvent;
   import com.sulake.habbo.session.events.RoomSessionUserFigureUpdateEvent;
   import com.sulake.habbo.session.events.RoomSessionUserGivableBadgesEvent;
   import com.sulake.habbo.session.events.UserTagsReceivedEvent;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.habbo.widget.events.RoomWidgetBadgeImageUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetChatInputContentUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFurniInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPetCommandsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserBadgesUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserFigureUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserGivableBadgesUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserTagsUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetChangeMottoMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetFurniActionMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetGetBadgeDetailsMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetGetBadgeImageMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetGiveBadgeMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetPetCommandMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomTagSearchMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetUserActionMessage;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.utils.getTimer;
   
   public class InfoStandWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var var_737:Boolean = false;
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var var_583:Map;
      
      public function InfoStandWidgetHandler()
      {
         this.var_583 = new Map();
         super();
      }
      
      public function get disposed() : Boolean
      {
         return this.var_737;
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_460;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         if(this._container != null)
         {
            if(this._container.sessionDataManager != null)
            {
               this._container.sessionDataManager.events.removeEventListener(UserTagsReceivedEvent.const_162,this.onUserTags);
               this._container.sessionDataManager.events.removeEventListener(BadgeImageReadyEvent.const_146,this.onBadgeImage);
            }
            if(this._container.roomSessionManager != null)
            {
               this._container.roomSessionManager.events.removeEventListener(RoomSessionUserFigureUpdateEvent.const_159,this.onFigureUpdate);
               this._container.roomSessionManager.events.removeEventListener(RoomSessionPetInfoUpdateEvent.PET_INFO,this.onPetInfo);
               this._container.roomSessionManager.events.removeEventListener(RoomSessionPetCommandsUpdateEvent.PET_COMMANDS,this.onPetCommands);
            }
         }
         this._container = param1;
         if(param1 == null)
         {
            return;
         }
         if(this._container.sessionDataManager != null)
         {
            this._container.sessionDataManager.events.addEventListener(UserTagsReceivedEvent.const_162,this.onUserTags);
            this._container.sessionDataManager.events.addEventListener(BadgeImageReadyEvent.const_146,this.onBadgeImage);
         }
         if(this._container.roomSessionManager != null)
         {
            this._container.roomSessionManager.events.addEventListener(RoomSessionUserFigureUpdateEvent.const_159,this.onFigureUpdate);
            this._container.roomSessionManager.events.addEventListener(RoomSessionPetInfoUpdateEvent.PET_INFO,this.onPetInfo);
            this._container.roomSessionManager.events.addEventListener(RoomSessionPetCommandsUpdateEvent.PET_COMMANDS,this.onPetCommands);
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(this.var_583 != null)
         {
            _loc1_ = this.var_583.length - 1;
            while(_loc1_ >= 0)
            {
               _loc2_ = this.var_583.getWithIndex(_loc1_);
               if(_loc2_)
               {
                  _loc2_.dispose();
               }
               _loc2_ = null;
               _loc1_--;
            }
            this.var_583.dispose();
            this.var_583 = null;
         }
         this.var_737 = true;
         this.container = null;
      }
      
      public function getWidgetMessages() : Array
      {
         var _loc1_:* = [];
         _loc1_.push(RoomWidgetRoomObjectMessage.const_351);
         _loc1_.push(RoomWidgetUserActionMessage.const_639);
         _loc1_.push(RoomWidgetUserActionMessage.const_784);
         _loc1_.push(RoomWidgetUserActionMessage.const_769);
         _loc1_.push(RoomWidgetUserActionMessage.const_683);
         _loc1_.push(RoomWidgetUserActionMessage.const_657);
         _loc1_.push(RoomWidgetUserActionMessage.const_510);
         _loc1_.push(RoomWidgetUserActionMessage.const_882);
         _loc1_.push(RoomWidgetUserActionMessage.const_780);
         _loc1_.push(RoomWidgetUserActionMessage.const_821);
         _loc1_.push(RoomWidgetUserActionMessage.const_672);
         _loc1_.push(RoomWidgetUserActionMessage.const_874);
         _loc1_.push(RoomWidgetGiveBadgeMessage.GIVE_BADGE);
         _loc1_.push(RoomWidgetFurniActionMessage.const_287);
         _loc1_.push(RoomWidgetFurniActionMessage.const_779);
         _loc1_.push(RoomWidgetFurniActionMessage.const_777);
         _loc1_.push(RoomWidgetRoomTagSearchMessage.const_661);
         _loc1_.push(RoomWidgetGetBadgeDetailsMessage.const_646);
         _loc1_.push(RoomWidgetGetBadgeImageMessage.const_850);
         _loc1_.push(RoomWidgetUserActionMessage.const_479);
         _loc1_.push(RoomWidgetUserActionMessage.const_817);
         _loc1_.push(RoomWidgetUserActionMessage.const_442);
         _loc1_.push(RoomWidgetUserActionMessage.const_1491);
         _loc1_.push(RoomWidgetPetCommandMessage.const_427);
         _loc1_.push(RoomWidgetPetCommandMessage.const_708);
         _loc1_.push(RoomWidgetUserActionMessage.const_485);
         _loc1_.push(RoomWidgetUserActionMessage.const_350);
         _loc1_.push(RoomWidgetChangeMottoMessage.const_679);
         return _loc1_;
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         if(param1 == null)
         {
            return null;
         }
         if(this._container == null)
         {
            return null;
         }
         var _loc2_:int = 0;
         _loc4_ = param1 as RoomWidgetUserActionMessage;
         if(_loc4_ != null)
         {
            _loc2_ = _loc4_.userId;
            if(_loc4_.type == RoomWidgetUserActionMessage.const_479)
            {
               _loc3_ = this._container.roomSession.userDataManager.getUserDataByIndex(_loc2_);
            }
            else if(param1.type == RoomWidgetUserActionMessage.const_350 || param1.type == RoomWidgetUserActionMessage.const_485 || param1.type == RoomWidgetUserActionMessage.const_442)
            {
               _loc3_ = this._container.roomSession.userDataManager.getPetUserData(_loc2_);
            }
            else
            {
               _loc3_ = this._container.roomSession.userDataManager.getUserData(_loc2_);
            }
            if(_loc3_ == null)
            {
               return null;
            }
         }
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:RoomWidgetFurniActionMessage = param1 as RoomWidgetFurniActionMessage;
         if(_loc7_ != null)
         {
            _loc5_ = _loc7_.furniId;
            _loc6_ = _loc7_.furniCategory;
         }
         switch(param1.type)
         {
            case RoomWidgetRoomObjectMessage.const_351:
               return this.handleGetObjectInfoMessage(param1 as RoomWidgetRoomObjectMessage);
            case RoomWidgetUserActionMessage.const_639:
               this._container.friendList.askForAFriend(_loc2_,_loc3_.name);
               break;
            case RoomWidgetUserActionMessage.const_784:
               this._container.sessionDataManager.giveRespect(_loc2_);
               break;
            case RoomWidgetUserActionMessage.const_485:
               this._container.sessionDataManager.givePetRespect(_loc2_);
               break;
            case RoomWidgetUserActionMessage.const_769:
               _loc8_ = new RoomWidgetChatInputContentUpdateEvent(RoomWidgetChatInputContentUpdateEvent.const_1194,_loc3_.name);
               this._container.events.dispatchEvent(_loc8_);
               break;
            case RoomWidgetUserActionMessage.const_683:
               this._container.sessionDataManager.ignoreUser(_loc3_.name);
               break;
            case RoomWidgetUserActionMessage.const_657:
               this._container.sessionDataManager.unignoreUser(_loc3_.name);
               break;
            case RoomWidgetUserActionMessage.const_510:
               this._container.roomSession.kickUser(_loc3_.webID);
               break;
            case RoomWidgetUserActionMessage.const_882:
               this._container.roomSession.banUser(_loc3_.webID);
               break;
            case RoomWidgetUserActionMessage.const_780:
               this._container.roomSession.assignRights(_loc3_.webID);
               break;
            case RoomWidgetUserActionMessage.const_821:
               this._container.roomSession.removeRights(_loc3_.webID);
               break;
            case RoomWidgetUserActionMessage.const_672:
               _loc9_ = this._container.roomSession.userDataManager.getUserData(_loc4_.userId);
               this._container.inventory.setupTrading(_loc9_.id,_loc9_.name);
               break;
            case RoomWidgetUserActionMessage.const_874:
               this._container.sessionDataManager.openHabboHomePage(_loc3_.webID);
               break;
            case RoomWidgetUserActionMessage.const_442:
               this._container.roomSession.pickUpPet(_loc2_);
               break;
            case RoomWidgetGiveBadgeMessage.GIVE_BADGE:
               _loc10_ = param1 as RoomWidgetGiveBadgeMessage;
               this._container.roomSession.giveBadge(_loc10_.userId,_loc10_.badgeId);
               break;
            case RoomWidgetFurniActionMessage.const_779:
               this._container.roomEngine.modifyRoomObject(_loc5_,_loc6_,RoomObjectOperationEnum.OBJECT_ROTATE_POSITIVE);
               break;
            case RoomWidgetFurniActionMessage.const_287:
               this._container.roomEngine.modifyRoomObject(_loc5_,_loc6_,RoomObjectOperationEnum.OBJECT_MOVE);
               break;
            case RoomWidgetFurniActionMessage.const_777:
               this._container.roomEngine.modifyRoomObject(_loc5_,_loc6_,RoomObjectOperationEnum.OBJECT_PICKUP);
               break;
            case RoomWidgetUserActionMessage.const_350:
               if(this._container.roomSession != null && this._container.roomSession.userDataManager != null)
               {
                  this._container.roomSession.userDataManager.requestPetInfo(_loc2_);
               }
               break;
            case RoomWidgetRoomTagSearchMessage.const_661:
               _loc11_ = param1 as RoomWidgetRoomTagSearchMessage;
               if(_loc11_ == null)
               {
                  return null;
               }
               this._container.navigator.performTagSearch(_loc11_.tag);
               break;
            case RoomWidgetGetBadgeDetailsMessage.const_646:
               _loc12_ = param1 as RoomWidgetGetBadgeDetailsMessage;
               if(_loc12_ == null)
               {
                  return null;
               }
               this._container.sessionDataManager.showGroupBadgeInfo(_loc12_.groupId);
               break;
            case RoomWidgetGetBadgeImageMessage.const_850:
               _loc13_ = param1 as RoomWidgetGetBadgeImageMessage;
               if(_loc13_ == null)
               {
                  return null;
               }
               _loc14_ = this._container.sessionDataManager.getBadgeImage(_loc13_.badgeId);
               if(_loc14_ != null)
               {
                  this._container.events.dispatchEvent(new RoomWidgetBadgeImageUpdateEvent(_loc13_.badgeId,_loc14_));
               }
               break;
            case RoomWidgetUserActionMessage.const_479:
               this._container.roomSession.kickBot(_loc2_);
               break;
            case RoomWidgetUserActionMessage.const_817:
               if(this._container == null || this._container.habboHelp == null)
               {
                  break;
               }
               if(_loc3_ == null)
               {
                  break;
               }
               this._container.habboHelp.reportUser(_loc2_,_loc3_.name);
               break;
            case RoomWidgetPetCommandMessage.const_708:
               _loc15_ = param1 as RoomWidgetPetCommandMessage;
               this._container.roomSession.requestPetCommands(_loc15_.petId);
               break;
            case RoomWidgetPetCommandMessage.const_427:
               _loc16_ = param1 as RoomWidgetPetCommandMessage;
               this._container.roomSession.sendChatMessage(_loc16_.value);
               break;
            case RoomWidgetChangeMottoMessage.const_679:
               _loc17_ = param1 as RoomWidgetChangeMottoMessage;
               this._container.roomSession.sendChangeMottoMessage(_loc17_.motto);
         }
         return null;
      }
      
      private function handleGetObjectInfoMessage(param1:RoomWidgetRoomObjectMessage) : RoomWidgetUpdateEvent
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:* = null;
         var _loc26_:* = null;
         var _loc27_:Boolean = false;
         var _loc28_:* = false;
         var _loc29_:Boolean = false;
         var _loc30_:int = 0;
         var _loc31_:* = null;
         var _loc32_:* = null;
         var _loc33_:* = null;
         var _loc34_:int = 0;
         var _loc35_:* = null;
         var _loc36_:* = null;
         _loc2_ = this._container.roomSession.roomId;
         _loc3_ = this._container.roomSession.roomCategory;
         switch(param1.category)
         {
            case RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE:
            case RoomObjectCategoryEnum.const_27:
               if(this._container.events == null || this._container.roomEngine == null)
               {
                  return null;
               }
               if(param1.id < 0)
               {
                  return null;
               }
               _loc4_ = 4282203453;
               _loc5_ = this._container.roomEngine.getRoomObjectImage(_loc2_,_loc3_,param1.id,param1.category,new Vector3d(180),32,null,_loc4_);
               _loc6_ = new RoomWidgetFurniInfoUpdateEvent(RoomWidgetFurniInfoUpdateEvent.const_608);
               _loc6_.id = param1.id;
               _loc6_.category = param1.category;
               _loc7_ = this._container.roomEngine.getRoomObject(_loc2_,_loc3_,param1.id,param1.category);
               if(_loc7_ == null || _loc7_.getModel() == null)
               {
                  return null;
               }
               _loc8_ = _loc7_.getType();
               if(_loc8_.indexOf("poster") == 0)
               {
                  _loc23_ = int(_loc8_.replace("poster",""));
                  _loc6_.name = "${poster_" + _loc23_ + "_name}";
                  _loc6_.description = "${poster_" + _loc23_ + "_desc}";
               }
               else
               {
                  _loc24_ = _loc7_.getModel().getNumber(RoomObjectVariableEnum.const_399);
                  if(param1.category == RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE)
                  {
                     _loc25_ = this._container.sessionDataManager.getFloorItemData(_loc24_);
                  }
                  else if(param1.category == RoomObjectCategoryEnum.const_27)
                  {
                     _loc25_ = this._container.sessionDataManager.getWallItemData(_loc24_);
                  }
                  if(_loc25_ != null)
                  {
                     _loc6_.name = _loc25_.title;
                     _loc6_.description = _loc25_.description;
                     _loc6_.catalogPageId = _loc25_.catalogPageId;
                     _loc6_.offerId = _loc25_.offerId;
                     if(this._container.userDefinedRoomEvents != null && param1.category == RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE)
                     {
                        this._container.userDefinedRoomEvents.stuffSelected(_loc7_.getId(),_loc25_.title);
                     }
                  }
               }
               if(_loc8_.indexOf("post_it") > -1)
               {
                  _loc6_.isStickie = true;
               }
               _loc6_.image = _loc5_.data;
               _loc9_ = _loc7_.getModel().getNumber(RoomObjectVariableEnum.const_1018);
               _loc10_ = _loc7_.getModel().getNumber(RoomObjectVariableEnum.const_1168);
               _loc6_.expiration = _loc9_ - (getTimer() - _loc10_) / 60000;
               _loc6_.isWallItem = param1.category == RoomObjectCategoryEnum.const_27;
               _loc6_.isRoomOwner = this._container.roomSession.isRoomOwner;
               _loc6_.isRoomController = this._container.roomSession.isRoomController;
               _loc6_.isAnyRoomController = this._container.sessionDataManager.isAnyRoomController;
               this._container.events.dispatchEvent(_loc6_);
               break;
            case RoomObjectCategoryEnum.OBJECT_CATEGORY_USER:
               if(this._container.roomSession == null || this._container.sessionDataManager == null || this._container.events == null || this._container.roomEngine == null || this._container.friendList == null || this._container.toolbar == null)
               {
                  return null;
               }
               _loc11_ = this._container.roomSession.userDataManager.getUserDataByIndex(param1.id);
               if(_loc11_ == null)
               {
                  return null;
               }
               if(_loc11_.type == RoomObjectTypeEnum.const_226)
               {
                  this._container.roomSession.userDataManager.requestPetInfo(_loc11_.webID);
                  return null;
               }
               if(_loc11_.type == RoomObjectTypeEnum.const_374)
               {
                  _loc12_ = "null";
                  if(_loc11_.webID != this._container.sessionDataManager.userId)
                  {
                     _loc12_ = "null";
                  }
               }
               else
               {
                  if(_loc11_.type != RoomObjectTypeEnum.const_1133)
                  {
                     return null;
                  }
                  _loc12_ = "null";
               }
               _loc13_ = new RoomWidgetUserInfoUpdateEvent(_loc12_);
               _loc13_.isSpectatorMode = this._container.roomSession.isSpectatorMode;
               _loc13_.name = _loc11_.name;
               _loc13_.motto = _loc11_.custom;
               _loc13_.achievementScore = _loc11_.achievementScore;
               _loc13_.webID = _loc11_.webID;
               _loc13_.userRoomId = param1.id;
               _loc14_ = new Array();
               _loc15_ = new Array();
               _loc17_ = this._container.roomEngine.getRoomObject(_loc2_,_loc3_,param1.id,param1.category);
               if(_loc17_ != null)
               {
                  _loc13_.carryItem = _loc17_.getModel().getNumber(RoomObjectVariableEnum.const_575);
               }
               if(_loc12_ == RoomWidgetUserInfoUpdateEvent.const_191)
               {
                  _loc13_.realName = this._container.sessionDataManager.realName;
               }
               if(_loc12_ == RoomWidgetUserInfoUpdateEvent.const_230)
               {
                  _loc13_.canBeAskedAsFriend = this._container.friendList.canBeAskedForAFriend(_loc11_.webID);
                  _loc26_ = this._container.friendList.getFriend(_loc11_.webID);
                  if(_loc26_ != null)
                  {
                     _loc13_.realName = _loc26_.realName;
                  }
                  if(_loc17_ != null)
                  {
                     _loc32_ = _loc17_.getModel().getString(RoomObjectVariableEnum.const_876);
                     _loc13_.hasFlatControl = _loc32_ == "onlyfurniture" || _loc32_ == "useradmin" || _loc32_ == "";
                     _loc13_.canBeKicked = this._container.roomSession.isPrivateRoom;
                  }
                  _loc13_.isIgnored = this._container.sessionDataManager.isIgnored(_loc11_.name);
                  _loc13_.amIOwner = this._container.roomSession.isRoomOwner;
                  _loc13_.amIController = this._container.roomSession.isRoomController;
                  _loc13_.amIAnyRoomController = this._container.sessionDataManager.isAnyRoomController;
                  _loc13_.respectLeft = this._container.sessionDataManager.respectLeft;
                  _loc27_ = this._container.sessionDataManager.hasUserRight("fuse_trade");
                  _loc28_ = !this._container.sessionDataManager.systemShutDown;
                  _loc29_ = this._container.roomSession.isTradingRoom;
                  _loc13_.canTrade = _loc27_ && _loc28_ && _loc29_;
                  _loc13_.canTradeReason = RoomWidgetUserInfoUpdateEvent.const_1485;
                  if(!_loc27_)
                  {
                     _loc13_.canTradeReason = RoomWidgetUserInfoUpdateEvent.TRADE_REASON_NO_OWN_RIGHT;
                  }
                  if(!_loc28_)
                  {
                     _loc13_.canTradeReason = RoomWidgetUserInfoUpdateEvent.const_1009;
                  }
                  if(!_loc29_)
                  {
                     _loc13_.canTradeReason = RoomWidgetUserInfoUpdateEvent.const_1129;
                  }
                  _loc30_ = this._container.sessionDataManager.userId;
                  _loc31_ = this._container.sessionDataManager.getUserTags(_loc30_);
                  this.dispatchUserTags(_loc30_,_loc31_);
               }
               if(_loc12_ == RoomWidgetUserInfoUpdateEvent.BOT)
               {
                  _loc13_.canBeKicked = this._container.roomSession.isRoomOwner;
                  _loc14_.push(RoomWidgetUserInfoUpdateEvent.const_1520);
               }
               else
               {
                  _loc14_ = this._container.roomSession.userDataManager.getUserBadges(_loc11_.webID);
                  _loc15_ = this._container.roomSession.userDataManager.getUserGivableBadges();
                  _loc16_ = this._container.sessionDataManager.getGroupBadgeId(int(_loc11_.groupID));
                  _loc13_.groupId = int(_loc11_.groupID);
                  _loc13_.groupBadgeId = _loc16_;
               }
               _loc13_.badges = _loc14_;
               _loc13_.givableBadges = _loc15_;
               _loc18_ = _loc11_.figure;
               _loc19_ = _loc11_.sex;
               _loc20_ = this._container.avatarRenderManager.createAvatarImage(_loc18_,AvatarScaleType.const_54,_loc19_);
               if(_loc20_ != null)
               {
                  _loc20_.setDirection(AvatarSetType.const_34,4);
                  _loc13_.image = _loc20_.getImage(AvatarSetType.const_34,true);
                  _loc20_.dispose();
               }
               this._container.events.dispatchEvent(_loc13_);
               if(_loc11_.type == RoomObjectTypeEnum.const_374)
               {
                  _loc33_ = this._container.sessionDataManager.getUserTags(_loc11_.webID);
                  this.dispatchUserTags(_loc11_.webID,_loc33_);
               }
               _loc34_ = 0;
               while(_loc34_ < _loc14_.length)
               {
                  _loc22_ = _loc14_[_loc34_];
                  _loc21_ = this._container.sessionDataManager.getBadgeImage(_loc22_);
                  if(_loc21_ != null)
                  {
                     this._container.events.dispatchEvent(new RoomWidgetBadgeImageUpdateEvent(_loc22_,_loc21_));
                  }
                  _loc34_++;
               }
               for each(_loc35_ in _loc15_)
               {
                  _loc22_ = _loc35_.achievementTypeName;
                  _loc21_ = this._container.sessionDataManager.getBadgeImage(_loc22_);
                  if(_loc21_ != null)
                  {
                     this._container.events.dispatchEvent(new RoomWidgetBadgeImageUpdateEvent(_loc22_,_loc21_));
                  }
               }
               if(_loc16_ != null)
               {
                  _loc36_ = this._container.sessionDataManager.getGroupBadgeImage(_loc16_);
                  if(_loc36_ != null)
                  {
                     this._container.events.dispatchEvent(new RoomWidgetBadgeImageUpdateEvent(_loc16_,_loc36_));
                  }
               }
               break;
         }
         return null;
      }
      
      public function getProcessedEvents() : Array
      {
         return [RoomSessionUserBadgesEvent.const_65,RoomSessionUserGivableBadgesEvent.const_65];
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         switch(param1.type)
         {
            case RoomSessionUserBadgesEvent.const_65:
               _loc2_ = param1 as RoomSessionUserBadgesEvent;
               if(_loc2_ == null)
               {
                  return;
               }
               this._container.events.dispatchEvent(new RoomWidgetUserBadgesUpdateEvent(_loc2_.userId,_loc2_.badges));
               _loc4_ = 0;
               while(_loc4_ < _loc2_.badges.length)
               {
                  _loc5_ = _loc2_.badges[_loc4_];
                  _loc6_ = this._container.sessionDataManager.getBadgeImage(_loc5_);
                  if(_loc6_ != null)
                  {
                     this._container.events.dispatchEvent(new RoomWidgetBadgeImageUpdateEvent(_loc5_,_loc6_));
                  }
                  _loc4_++;
               }
               break;
            case RoomSessionUserGivableBadgesEvent.const_65:
               _loc3_ = param1 as RoomSessionUserGivableBadgesEvent;
               if(_loc3_ == null)
               {
                  return;
               }
               this._container.events.dispatchEvent(new RoomWidgetUserGivableBadgesUpdateEvent(_loc3_.badges));
               for each(_loc7_ in _loc3_.badges)
               {
                  _loc8_ = _loc7_.achievementTypeName;
                  _loc9_ = this._container.sessionDataManager.getBadgeImage(_loc8_);
                  if(_loc9_ != null)
                  {
                     this._container.events.dispatchEvent(new RoomWidgetBadgeImageUpdateEvent(_loc8_,_loc9_));
                  }
               }
               break;
         }
      }
      
      private function onUserTags(param1:UserTagsReceivedEvent) : void
      {
         this.dispatchUserTags(param1.userId,param1.tags);
      }
      
      private function dispatchUserTags(param1:int, param2:Array) : void
      {
         if(param2 == null)
         {
            return;
         }
         var _loc3_:* = false;
         if(this._container.sessionDataManager != null)
         {
            _loc3_ = param1 == this._container.sessionDataManager.userId;
         }
         if(this._container != null && this._container.events != null)
         {
            this._container.events.dispatchEvent(new RoomWidgetUserTagsUpdateEvent(param1,param2,_loc3_));
         }
      }
      
      private function onBadgeImage(param1:BadgeImageReadyEvent) : void
      {
         if(this._container != null && this._container.events != null)
         {
            this._container.events.dispatchEvent(new RoomWidgetBadgeImageUpdateEvent(param1.badgeId,param1.badgeImage));
         }
      }
      
      private function onFigureUpdate(param1:RoomSessionUserFigureUpdateEvent) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = false;
         if(this._container == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(param1.userId < 0)
         {
            return;
         }
         var _loc2_:IUserData = this._container.roomSession.userDataManager.getUserDataByIndex(param1.userId);
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:int = _loc2_.webID;
         var _loc4_:* = null;
         if(this._container.avatarRenderManager != null)
         {
            _loc5_ = this._container.avatarRenderManager.createAvatarImage(param1.figure,AvatarScaleType.const_54,param1.gender);
            if(_loc5_ != null)
            {
               _loc5_.setDirection(AvatarSetType.const_34,4);
               _loc4_ = _loc5_.getImage(AvatarSetType.const_34,true);
               _loc5_.dispose();
            }
            _loc6_ = _loc3_ == this._container.sessionDataManager.userId;
            if(this._container != null && this._container.events != null)
            {
               this._container.events.dispatchEvent(new RoomWidgetUserFigureUpdateEvent(_loc3_,_loc4_,_loc6_,param1.customInfo,param1.achievementScore));
            }
         }
      }
      
      private function onPetInfo(param1:RoomSessionPetInfoUpdateEvent) : void
      {
         var _loc8_:* = false;
         var _loc9_:* = null;
         var _loc10_:Boolean = false;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc2_:IPetInfo = param1.petInfo;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IUserData = this._container.roomSession.userDataManager.getPetUserData(_loc2_.petId);
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:String = _loc3_.figure;
         var _loc5_:int = this.getPetType(_loc4_);
         var _loc6_:int = this.getPetRace(_loc4_);
         var _loc7_:BitmapData = this.var_583.getValue(_loc4_) as BitmapData;
         if(_loc7_ == null)
         {
            _loc7_ = this.getPetImage(_loc4_);
            this.var_583.add(_loc4_,_loc7_);
         }
         if(this._container != null && this._container.events != null)
         {
            _loc8_ = _loc2_.ownerId == this._container.sessionDataManager.userId;
            _loc9_ = new RoomWidgetPetInfoUpdateEvent(_loc5_,_loc6_,_loc3_.name,_loc2_.petId,_loc7_,_loc8_,_loc2_.ownerId,_loc2_.ownerName,_loc3_.id);
            _loc9_.level = _loc2_.level;
            _loc9_.levelMax = _loc2_.levelMax;
            _loc9_.experience = _loc2_.experience;
            _loc9_.experienceMax = _loc2_.experienceMax;
            _loc9_.energy = _loc2_.energy;
            _loc9_.energyMax = _loc2_.energyMax;
            _loc9_.nutrition = _loc2_.nutrition;
            _loc9_.nutritionMax = _loc2_.nutritionMax;
            _loc9_.petRespect = _loc2_.respect;
            _loc9_.petRespectLeft = this._container.sessionDataManager.petRespectLeft;
            _loc9_.age = _loc2_.age;
            _loc10_ = false;
            _loc11_ = this._container.roomSession.roomId;
            _loc12_ = this._container.roomSession.roomCategory;
            _loc13_ = this._container.roomSession.userDataManager.getUserData(_loc2_.ownerId);
            if(_loc13_ != null)
            {
               _loc14_ = this._container.roomEngine.getRoomObject(_loc11_,_loc12_,_loc13_.id,RoomObjectCategoryEnum.OBJECT_CATEGORY_USER);
               if(_loc14_ != null)
               {
                  _loc15_ = _loc14_.getModel().getString(RoomObjectVariableEnum.const_876);
                  _loc10_ = (this._container.roomSession.isRoomOwner || this._container.roomSession.isRoomController || this._container.sessionDataManager.isAnyRoomController) && _loc15_ != "useradmin" && this._container.roomSession.isPrivateRoom && !_loc8_;
               }
            }
            _loc9_.canOwnerBeKicked = _loc10_;
            this._container.events.dispatchEvent(_loc9_);
         }
      }
      
      private function onPetCommands(param1:RoomSessionPetCommandsUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(this._container != null && this._container.events != null)
         {
            _loc2_ = new RoomWidgetPetCommandsUpdateEvent(param1.petId,param1.allCommands,param1.enabledCommands);
            this._container.events.dispatchEvent(_loc2_);
         }
      }
      
      public function update() : void
      {
      }
      
      private function getPetImage(param1:String) : BitmapData
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc2_:* = null;
         var _loc3_:int = this.getPetType(param1);
         if(_loc3_ < 8)
         {
            _loc4_ = this._container.avatarRenderManager.createPetImageFromFigure(param1,AvatarScaleType.const_54,null);
            if(_loc4_ != null)
            {
               _loc2_ = _loc4_.getCroppedImage(AvatarSetType.const_34);
               _loc4_.dispose();
            }
         }
         else
         {
            _loc5_ = this.getPetRace(param1);
            _loc6_ = 0;
            _loc7_ = this._container.roomEngine.getPetImage(_loc3_,_loc5_,new Vector3d(90),64,null,_loc6_);
            if(_loc7_ != null)
            {
               _loc2_ = _loc7_.data;
            }
         }
         if(_loc2_ == null)
         {
            _loc2_ = new BitmapData(30,30,false,4289374890);
         }
         return _loc2_;
      }
      
      private function getPetType(param1:String) : int
      {
         return this.getSpaceSeparatedInteger(param1,0);
      }
      
      private function getPetRace(param1:String) : int
      {
         return this.getSpaceSeparatedInteger(param1,1);
      }
      
      private function getSpaceSeparatedInteger(param1:String, param2:int) : int
      {
         var _loc3_:* = null;
         if(param1 != null)
         {
            _loc3_ = param1.split(" ");
            if(_loc3_.length > param2)
            {
               return int(_loc3_[param2]);
            }
         }
         return -1;
      }
   }
}
