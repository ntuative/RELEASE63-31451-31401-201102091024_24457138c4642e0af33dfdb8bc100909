package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class OpenPetPackageResultMessageParser implements IMessageParser
   {
       
      
      private var _objectId:int = 0;
      
      private var var_1619:int = 0;
      
      public function OpenPetPackageResultMessageParser()
      {
         super();
      }
      
      public function get objectId() : int
      {
         return this._objectId;
      }
      
      public function get nameValidationStatus() : int
      {
         return this.var_1619;
      }
      
      public function flush() : Boolean
      {
         this._objectId = 0;
         this.var_1619 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this._objectId = param1.readInteger();
         this.var_1619 = param1.readInteger();
         return true;
      }
   }
}
