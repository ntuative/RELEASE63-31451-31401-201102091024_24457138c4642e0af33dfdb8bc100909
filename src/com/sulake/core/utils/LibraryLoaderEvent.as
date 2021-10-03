package com.sulake.core.utils
{
   import flash.events.Event;
   
   public class LibraryLoaderEvent extends Event
   {
      
      public static const LIBRARY_LOADER_EVENT_COMPLETE:String = "LIBRARY_LOADER_EVENT_COMPLETE";
      
      public static const LIBRARY_LOADER_EVENT_PROGRESS:String = "LIBRARY_LOADER_EVENT_PROGRESS";
      
      public static const LIBRARY_LOADER_EVENT_UNLOAD:String = "LIBRARY_LOADER_EVENT_UNLOAD";
      
      public static const LIBRARY_LOADER_EVENT_STATUS:String = "LIBRARY_LOADER_EVENT_STATUS";
      
      public static const LIBRARY_LOADER_EVENT_ERROR:String = "LIBRARY_LOADER_EVENT_ERROR";
      
      public static const LIBRARY_LOADER_EVENT_DEBUG:String = "LIBRARY_LOADER_EVENT_DEBUG";
      
      public static const LIBRARY_LOADER_EVENT_DISPOSE:String = "LIBRARY_LOADER_EVENT_DISPOSE";
       
      
      private var var_371:int;
      
      private var var_1514:uint;
      
      private var var_1513:uint;
      
      private var var_2040:uint;
      
      public function LibraryLoaderEvent(param1:String, param2:int, param3:uint, param4:uint, param5:uint)
      {
         this.var_371 = param2;
         this.var_1514 = param3;
         this.var_1513 = param4;
         this.var_2040 = param5;
         super(param1,false,false);
      }
      
      public function get status() : int
      {
         return this.var_371;
      }
      
      public function get bytesTotal() : uint
      {
         return this.var_1514;
      }
      
      public function get bytesLoaded() : uint
      {
         return this.var_1513;
      }
      
      public function get elapsedTime() : uint
      {
         return this.var_2040;
      }
      
      override public function clone() : Event
      {
         return new LibraryLoaderEvent(type,this.var_371,this.var_1514,this.var_1513,this.elapsedTime);
      }
   }
}
