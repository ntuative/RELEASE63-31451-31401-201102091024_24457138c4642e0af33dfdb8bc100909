package com.sulake.habbo.communication.messages.incoming.recycler
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PrizeMessageData
   {
       
      
      private var var_2202:String;
      
      private var var_1809:int;
      
      public function PrizeMessageData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2202 = param1.readString();
         this.var_1809 = param1.readInteger();
      }
      
      public function get productItemType() : String
      {
         return this.var_2202;
      }
      
      public function get productItemTypeId() : int
      {
         return this.var_1809;
      }
   }
}
