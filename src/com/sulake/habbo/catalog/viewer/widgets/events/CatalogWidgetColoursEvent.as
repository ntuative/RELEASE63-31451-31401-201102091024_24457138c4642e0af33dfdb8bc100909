package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetColoursEvent extends Event
   {
       
      
      private var var_1246:Array;
      
      private var var_2389:String;
      
      private var var_2388:String;
      
      private var var_2387:String;
      
      public function CatalogWidgetColoursEvent(param1:Array, param2:String, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(WidgetEvent.CWE_COLOUR_ARRAY,param5,param6);
         this.var_1246 = param1;
         this.var_2389 = param2;
         this.var_2388 = param3;
         this.var_2387 = param4;
      }
      
      public function get colours() : Array
      {
         return this.var_1246;
      }
      
      public function get backgroundAssetName() : String
      {
         return this.var_2389;
      }
      
      public function get colourAssetName() : String
      {
         return this.var_2388;
      }
      
      public function get chosenColourAssetName() : String
      {
         return this.var_2387;
      }
   }
}
