package com.sulake.habbo.widget.messages
{
   public class RoomWidgetGetBadgeImageMessage extends RoomWidgetMessage
   {
      
      public static const const_850:String = "RWGOI_MESSAGE_GET_BADGE_IMAGE";
       
      
      private var var_286:String = "";
      
      public function RoomWidgetGetBadgeImageMessage(param1:String)
      {
         super(const_850);
         this.var_286 = param1;
      }
      
      public function get badgeId() : String
      {
         return this.var_286;
      }
   }
}
