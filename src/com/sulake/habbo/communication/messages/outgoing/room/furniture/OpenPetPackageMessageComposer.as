package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class OpenPetPackageMessageComposer implements IMessageComposer
   {
       
      
      private var _objectId:int;
      
      private var var_2397:String;
      
      public function OpenPetPackageMessageComposer(param1:int, param2:String)
      {
         super();
         this._objectId = param1;
         this.var_2397 = param2;
      }
      
      public function getMessageArray() : Array
      {
         return [this._objectId,this.var_2397];
      }
      
      public function dispose() : void
      {
      }
   }
}
