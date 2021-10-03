package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_769:String = "RWUAM_WHISPER_USER";
      
      public static const const_683:String = "RWUAM_IGNORE_USER";
      
      public static const const_657:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_510:String = "RWUAM_KICK_USER";
      
      public static const const_882:String = "RWUAM_BAN_USER";
      
      public static const const_639:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_784:String = "RWUAM_RESPECT_USER";
      
      public static const const_780:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_821:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_672:String = "RWUAM_START_TRADING";
      
      public static const const_874:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_479:String = "RWUAM_KICK_BOT";
      
      public static const const_817:String = "RWUAM_REPORT";
      
      public static const const_442:String = "RWUAM_PICKUP_PET";
      
      public static const const_1491:String = "RWUAM_TRAIN_PET";
      
      public static const const_485:String = " RWUAM_RESPECT_PET";
      
      public static const const_350:String = "RWUAM_REQUEST_PET_UPDATE";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         this._userId = param2;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
   }
}
