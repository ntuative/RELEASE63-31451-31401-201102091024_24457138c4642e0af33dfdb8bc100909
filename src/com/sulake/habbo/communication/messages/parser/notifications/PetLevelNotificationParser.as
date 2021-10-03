package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_1601:int;
      
      private var var_2397:String;
      
      private var var_1293:int;
      
      private var var_630:String;
      
      private var var_1377:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1601 = param1.readInteger();
         this.var_2397 = param1.readString();
         this.var_1293 = param1.readInteger();
         this.var_630 = param1.readString();
         this.var_1377 = param1.readInteger();
         return true;
      }
      
      public function get petId() : int
      {
         return this.var_1601;
      }
      
      public function get petName() : String
      {
         return this.var_2397;
      }
      
      public function get level() : int
      {
         return this.var_1293;
      }
      
      public function get figure() : String
      {
         return this.var_630;
      }
      
      public function get petType() : int
      {
         return this.var_1377;
      }
   }
}
