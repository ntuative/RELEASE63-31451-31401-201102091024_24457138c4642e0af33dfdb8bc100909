package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   
   public class AssetLoaderEvent extends Event
   {
      
      public static const const_28:String = "AssetLoaderEventComplete";
      
      public static const const_999:String = "AssetLoaderEventProgress";
      
      public static const const_1062:String = "AssetLoaderEventUnload";
      
      public static const const_1089:String = "AssetLoaderEventStatus";
      
      public static const const_43:String = "AssetLoaderEventError";
      
      public static const const_1096:String = "AssetLoaderEventOpen";
       
      
      private var var_371:int;
      
      public function AssetLoaderEvent(param1:String, param2:int)
      {
         this.var_371 = param2;
         super(param1,false,false);
      }
      
      public function get status() : int
      {
         return this.var_371;
      }
      
      override public function clone() : Event
      {
         return new AssetLoaderEvent(type,this.var_371);
      }
   }
}
