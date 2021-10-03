package com.sulake.habbo.session.events
{
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class BadgeImageReadyEvent extends Event
   {
      
      public static const const_146:String = "BIRE_BADGE_IMAGE_READY";
       
      
      private var var_286:String;
      
      private var var_43:BitmapData;
      
      public function BadgeImageReadyEvent(param1:String, param2:BitmapData, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_146,param3,param4);
         this.var_286 = param1;
         this.var_43 = param2;
      }
      
      public function get badgeId() : String
      {
         return this.var_286;
      }
      
      public function get badgeImage() : BitmapData
      {
         return this.var_43;
      }
   }
}
