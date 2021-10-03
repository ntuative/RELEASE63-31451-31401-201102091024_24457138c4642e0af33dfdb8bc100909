package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   
   public class PetRespectNotificationParser implements IMessageParser
   {
       
      
      private var var_2325:int;
      
      private var var_2324:int;
      
      private var var_1444:PetData;
      
      public function PetRespectNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_1444 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2325 = param1.readInteger();
         this.var_2324 = param1.readInteger();
         this.var_1444 = new PetData(param1);
         return true;
      }
      
      public function get petOwnerId() : int
      {
         return this.var_2324;
      }
      
      public function get respect() : int
      {
         return this.var_2325;
      }
      
      public function get petData() : PetData
      {
         return this.var_1444;
      }
   }
}
