package com.sulake.habbo.quest
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.notifications.ActivityPointsMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.notifications.HabboActivityPointNotificationMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.quest.AvailableQuestCampaignsMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.quest.ExpiredQuestCampaignsMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestAcceptedMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestCompletedMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestListMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.engine.RoomEntryInfoMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.session.CloseConnectionMessageEvent;
   import com.sulake.habbo.communication.messages.parser.quest.AvailableQuestCampaignsMessageParser;
   import com.sulake.habbo.communication.messages.parser.quest.ExpiredQuestCampaignsMessageParser;
   import com.sulake.habbo.communication.messages.parser.quest.QuestAcceptedMessageParser;
   import com.sulake.habbo.communication.messages.parser.quest.QuestCompletedMessageParser;
   import com.sulake.habbo.communication.messages.parser.quest.QuestListMessageParser;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class IncomingMessages implements IDisposable
   {
       
      
      private var var_141:HabboQuestEngine;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_660:IAlertDialog;
      
      private var var_737:Boolean = false;
      
      public function IncomingMessages(param1:HabboQuestEngine)
      {
         super();
         this.var_141 = param1;
         this._communication = this.var_141.communication;
         this._communication.addHabboConnectionMessageEvent(new QuestListMessageEvent(this.onQuestList));
         this._communication.addHabboConnectionMessageEvent(new QuestAcceptedMessageEvent(this.onQuestAccepted));
         this._communication.addHabboConnectionMessageEvent(new QuestCompletedMessageEvent(this.onQuestCompleted));
         this._communication.addHabboConnectionMessageEvent(new CloseConnectionMessageEvent(this.onRoomExit));
         this._communication.addHabboConnectionMessageEvent(new RoomEntryInfoMessageEvent(this.onRoomEnter));
         this._communication.addHabboConnectionMessageEvent(new HabboActivityPointNotificationMessageEvent(this.onActivityPointNotification));
         this._communication.addHabboConnectionMessageEvent(new ActivityPointsMessageEvent(this.onActivityPoints));
         this._communication.addHabboConnectionMessageEvent(new AvailableQuestCampaignsMessageEvent(this.onAvailableQuestCampaign));
         this._communication.addHabboConnectionMessageEvent(new ExpiredQuestCampaignsMessageEvent(this.onExpiredQuestCampaigns));
      }
      
      public function get disposed() : Boolean
      {
         return this.var_737;
      }
      
      public function dispose() : void
      {
         if(this.var_660)
         {
            this.var_660.dispose();
            this.var_660 = null;
         }
         this.var_737 = true;
      }
      
      private function onQuestList(param1:IMessageEvent) : void
      {
         var _loc2_:QuestListMessageParser = (param1 as QuestListMessageEvent).getParser();
         Logger.log("Got Quest List: " + _loc2_.campaignCode + " quests: " + _loc2_.quests.length);
         this.var_141.controller.openCampaign(_loc2_.campaignCode,_loc2_.activityPointType,_loc2_.quests);
      }
      
      private function onQuestAccepted(param1:IMessageEvent) : void
      {
         var _loc2_:QuestAcceptedMessageParser = (param1 as QuestAcceptedMessageEvent).getParser();
         Logger.log("Quest Accepted: " + _loc2_.campaignCode + " quest: " + _loc2_.questData.id);
         this.var_141.controller.questAccepted(_loc2_.campaignCode,_loc2_.questData);
      }
      
      private function onQuestCompleted(param1:IMessageEvent) : void
      {
         var _loc2_:QuestCompletedMessageParser = (param1 as QuestCompletedMessageEvent).getParser();
         Logger.log("Quest Completed: " + _loc2_.campaignCode + " quest: " + _loc2_.questData.id);
         this.var_141.controller.questCompleted(_loc2_.campaignCode,_loc2_.questData);
      }
      
      private function onAvailableQuestCampaign(param1:IMessageEvent) : void
      {
         var _loc2_:AvailableQuestCampaignsMessageParser = (param1 as AvailableQuestCampaignsMessageEvent).getParser();
         Logger.log("Got Available Quest Campaigns: " + _loc2_.campaignCodes);
         if(_loc2_.campaignCodes.length == 0)
         {
            if(this.var_660)
            {
               this.var_660.dispose();
               this.var_660 = null;
            }
            this.var_660 = this.var_141.windowManager.alert("quest.nocampaigns.title","quest.nocampaigns.desc",0,this.onCloseAlert);
         }
         else
         {
            this.var_141.controller.openCampaigns(_loc2_.campaignCodes);
         }
      }
      
      private function onCloseAlert(param1:IAlertDialog, param2:Event) : void
      {
         param1.dispose();
      }
      
      private function onExpiredQuestCampaigns(param1:IMessageEvent) : void
      {
         var _loc2_:ExpiredQuestCampaignsMessageParser = (param1 as ExpiredQuestCampaignsMessageEvent).getParser();
         Logger.log("Got Expired Quest Campaigns: " + _loc2_.campaignCodes);
         if(_loc2_.campaignCodes.length > 0)
         {
            this.var_141.controller.openCampaigns(_loc2_.campaignCodes,true);
         }
      }
      
      private function onRoomEnter(param1:IMessageEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this.var_141.toolbar != null && this.var_141.configuration != null)
         {
            _loc2_ = this.var_141.configuration.getKey("questing.supportMultipleCampaigns","");
            _loc3_ = this.var_141.configuration.getKey("questing.defaultCampaign","");
            if(_loc3_ && _loc3_ != "" || _loc2_ && _loc2_ == "true")
            {
               this.var_141.toolbar.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_116,HabboToolbarIconEnum.QUESTS));
            }
         }
      }
      
      private function onRoomExit(param1:IMessageEvent) : void
      {
         this.var_141.controller.close();
         this.var_141.toolbar.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_156,HabboToolbarIconEnum.QUESTS));
      }
      
      private function onActivityPointNotification(param1:IMessageEvent) : void
      {
         var _loc2_:HabboActivityPointNotificationMessageEvent = param1 as HabboActivityPointNotificationMessageEvent;
         Logger.log("Got balance update");
         this.var_141.controller.updatePurse();
      }
      
      private function onActivityPoints(param1:IMessageEvent) : void
      {
         var _loc2_:ActivityPointsMessageEvent = param1 as ActivityPointsMessageEvent;
         Logger.log("Got balance");
         this.var_141.controller.updatePurse();
      }
   }
}
