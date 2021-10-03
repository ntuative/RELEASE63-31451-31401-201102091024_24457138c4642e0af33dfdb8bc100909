package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1540:int;
      
      private var var_1541:int;
      
      private var var_1542:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1541 = param1.readInteger();
         this.var_1540 = param1.readInteger();
         this.var_1542 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_1540 = 0;
         this.var_1541 = 0;
         this.var_1542 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return this.var_1540;
      }
      
      public function get messageId() : int
      {
         return this.var_1541;
      }
      
      public function get timestamp() : String
      {
         return this.var_1542;
      }
   }
}
