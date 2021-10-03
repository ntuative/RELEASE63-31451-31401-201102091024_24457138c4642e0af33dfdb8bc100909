package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_691:int = 1;
      
      public static const const_615:int = 2;
      
      public static const const_838:int = 3;
      
      public static const const_965:int = 4;
      
      public static const const_862:int = 5;
      
      public static const const_1142:int = 6;
       
      
      private var _type:int;
      
      private var var_1072:int;
      
      private var var_2334:String;
      
      private var var_2601:String;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this._type = param1;
         this.var_1072 = param2;
         this.var_2334 = param3;
         this.var_2601 = param4;
      }
      
      public function get messageText() : String
      {
         return this.var_2334;
      }
      
      public function get time() : String
      {
         return this.var_2601;
      }
      
      public function get senderId() : int
      {
         return this.var_1072;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
