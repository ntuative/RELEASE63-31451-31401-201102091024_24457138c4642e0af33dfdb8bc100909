package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_1755:Boolean;
      
      private var var_1101:PetData;
      
      public function PetReceivedMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1755 = param1.readBoolean();
         this.var_1101 = new PetData(param1);
         Logger.log("Got PetReceived: " + this.var_1755 + ", " + this.var_1101.id + ", " + this.var_1101.name + ", " + this.pet.figure + ", " + this.var_1101.type);
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return this.var_1755;
      }
      
      public function get pet() : PetData
      {
         return this.var_1101;
      }
   }
}
