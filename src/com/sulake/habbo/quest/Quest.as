package com.sulake.habbo.quest
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   import com.sulake.habbo.quest.enum.QuestStatusEnum;
   import flash.events.Event;
   
   public class Quest implements IDisposable
   {
       
      
      private var _view:IWindowContainer;
      
      private var var_63:QuestCampaign;
      
      private var _id:int;
      
      private var var_371:int;
      
      private var _type:String;
      
      private var var_1717:String;
      
      private var var_1719:int;
      
      private var var_1568:Date;
      
      private var var_717:String;
      
      private var _questBadgeAchievementTypeId:String;
      
      private var var_186:Boolean = false;
      
      private var var_2156:uint = 2;
      
      private var var_2157:uint = 0;
      
      private var var_825:IWindow;
      
      private var var_737:Boolean = false;
      
      public function Quest(param1:QuestMessageData, param2:QuestCampaign)
      {
         super();
         this.var_63 = param2;
         this._id = param1.id;
         this.update(param1);
      }
      
      public function dispose() : void
      {
         if(this._view)
         {
            this._view.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.itemGridEventProc);
            this._view.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.itemGridEventProc);
            this._view.removeEventListener(WindowMouseEvent.const_25,this.itemGridEventProc);
            this._view.dispose();
            this._view = null;
         }
         this.var_737 = true;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_737;
      }
      
      public function update(param1:QuestMessageData) : void
      {
         this.var_371 = param1.status;
         this._type = param1.type;
         this.var_1717 = param1.roomItemTypeName;
         this.var_1719 = param1.rewardCurrencyAmount;
         this.var_1568 = new Date();
         this.var_1568.setTime(param1.endDateTimeStamp);
         this.var_717 = param1.localizationCode;
         this._questBadgeAchievementTypeId = param1.questBadgeAchievementTypeId;
         this.updateView();
      }
      
      private function createView() : void
      {
         switch(this.var_371)
         {
            case QuestStatusEnum.const_44:
               this._view = this.var_63.controller.questEngine.getXmlWindow("QuestEntityAccepted") as IWindowContainer;
               break;
            case QuestStatusEnum.const_470:
               this._view = this.var_63.controller.questEngine.getXmlWindow("QuestEntityAvailable") as IWindowContainer;
               break;
            case QuestStatusEnum.const_179:
               this._view = this.var_63.controller.questEngine.getXmlWindow("QuestEntityExpired") as IWindowContainer;
               break;
            case QuestStatusEnum.const_612:
               this._view = this.var_63.controller.questEngine.getXmlWindow("QuestEntityCompleted") as IWindowContainer;
               break;
            case QuestStatusEnum.const_169:
               this._view = this.var_63.controller.questEngine.getXmlWindow("QuestEntityPreview") as IWindowContainer;
               break;
            default:
               this._view = this.var_63.controller.questEngine.getXmlWindow("QuestEntityExpired") as IWindowContainer;
         }
         if(!this._view)
         {
            return;
         }
         this._view.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.itemGridEventProc);
         this._view.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.itemGridEventProc);
         this._view.addEventListener(WindowMouseEvent.const_25,this.itemGridEventProc);
         var _loc1_:IWindow = this._view.findChildByTag("SELECTION_COLOR");
         if(_loc1_ != null)
         {
            this.var_825 = _loc1_;
         }
         else
         {
            this.var_825 = this._view;
         }
      }
      
      private function updateView() : void
      {
         var _loc2_:* = null;
         if(this._view == null)
         {
            this.createView();
         }
         var _loc1_:IBitmapWrapperWindow = this.find(this._view,"icon") as IBitmapWrapperWindow;
         switch(this.var_371)
         {
            case QuestStatusEnum.const_44:
               _loc2_ = ["icon",this.var_63.code,"active"].join("_");
               this.var_63.controller.questEngine.setImageFromAsset(_loc1_,_loc2_,this.onPreviewImageReady);
               break;
            case QuestStatusEnum.const_470:
               break;
            case QuestStatusEnum.const_179:
               break;
            case QuestStatusEnum.const_612:
               this.var_63.controller.questEngine.setImageFromAsset(_loc1_,"icon_complete",this.onPreviewImageReady);
         }
         var _loc3_:String = ["quest",this.var_63.code,this.var_717].join("_");
         var _loc4_:* = _loc3_ + ".title";
         var _loc5_:* = _loc3_ + ".short";
         this.setText("quest.title",_loc4_);
         this.setText("quest.short",_loc5_);
      }
      
      public function get endDate() : Date
      {
         return this.var_1568;
      }
      
      private function itemGridEventProc(param1:Event, param2:IWindow = null) : void
      {
         if(param2 == null)
         {
            param2 = param1.target as IWindow;
         }
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.var_63.activateListItem(this);
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            if(!this.var_186)
            {
               this.var_825.style = this.var_2157;
            }
         }
         else if(param1.type == WindowMouseEvent.const_25)
         {
            if(!this.var_186)
            {
               this.var_825.style = this.var_2156;
            }
         }
      }
      
      public function get selected() : Boolean
      {
         return this.var_186;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this.var_186 = param1;
         if(this.var_186)
         {
            this.var_825.style = this.var_2157;
         }
         else
         {
            this.var_825.style = this.var_2156;
         }
      }
      
      private function setText(param1:String, param2:String, param3:Boolean = true) : void
      {
         var _loc4_:IWindow = this._view.findChildByName(param1);
         if(_loc4_)
         {
            if(param3)
            {
               param2 = "${" + param2 + "}";
            }
            _loc4_.caption = param2;
         }
      }
      
      private function setVisible(param1:String, param2:Boolean) : void
      {
         var _loc3_:IWindow = this._view.findChildByName(param1);
         if(_loc3_)
         {
            _loc3_.visible = param2;
         }
      }
      
      private function find(param1:IWindowContainer, param2:String) : IWindow
      {
         var _loc3_:IWindow = param1.findChildByName(param2);
         if(_loc3_ == null)
         {
            throw new Error("Window element with name: " + param2 + " cannot be found!");
         }
         return _loc3_;
      }
      
      private function onPreviewImageReady(param1:AssetLoaderEvent) : void
      {
         var _loc3_:* = null;
         if(this.var_737)
         {
            return;
         }
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(_loc2_ != null)
         {
            _loc3_ = this.find(this._view,"icon") as IBitmapWrapperWindow;
            this.var_63.controller.questEngine.setImageFromAsset(_loc3_,_loc2_.assetName,this.onPreviewImageReady);
         }
      }
      
      public function get view() : IWindowContainer
      {
         return this._view;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get status() : int
      {
         return this.var_371;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get roomItemTypeName() : String
      {
         return this.var_1717;
      }
      
      public function get rewardCurrencyAmount() : int
      {
         return this.var_1719;
      }
      
      public function get localizationCode() : String
      {
         return this.var_717;
      }
      
      public function get questBadgeAchievementTypeId() : String
      {
         return this._questBadgeAchievementTypeId;
      }
   }
}
