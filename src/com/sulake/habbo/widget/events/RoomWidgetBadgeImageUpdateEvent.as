package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetBadgeImageUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_775:String = "RWBIUE_BADGE_IMAGE";
       
      
      private var var_2305:String;
      
      private var var_2511:BitmapData;
      
      public function RoomWidgetBadgeImageUpdateEvent(param1:String, param2:BitmapData, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_775,param3,param4);
         this.var_2305 = param1;
         this.var_2511 = param2;
      }
      
      public function get badgeID() : String
      {
         return this.var_2305;
      }
      
      public function get badgeImage() : BitmapData
      {
         return this.var_2511;
      }
   }
}
