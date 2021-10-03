package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_2131:int;
      
      private var var_2332:int;
      
      private var var_2329:String;
      
      private var var_2330:String;
      
      private var var_2331:int = 0;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this.var_2131 = param1;
         this.var_2332 = param2;
         this.var_2329 = param3;
         this.var_2330 = param4;
      }
      
      public function get id() : int
      {
         return this.var_2131;
      }
      
      public function get length() : int
      {
         return this.var_2332;
      }
      
      public function get name() : String
      {
         return this.var_2329;
      }
      
      public function get creator() : String
      {
         return this.var_2330;
      }
      
      public function get startPlayHeadPos() : int
      {
         return this.var_2331;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         this.var_2331 = param1;
      }
   }
}
