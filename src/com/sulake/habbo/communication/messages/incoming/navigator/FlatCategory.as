package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_1487:int;
      
      private var var_2510:String;
      
      private var var_373:Boolean;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         this.var_1487 = param1.readInteger();
         this.var_2510 = param1.readString();
         this.var_373 = param1.readBoolean();
      }
      
      public function get nodeId() : int
      {
         return this.var_1487;
      }
      
      public function get nodeName() : String
      {
         return this.var_2510;
      }
      
      public function get visible() : Boolean
      {
         return this.var_373;
      }
   }
}
