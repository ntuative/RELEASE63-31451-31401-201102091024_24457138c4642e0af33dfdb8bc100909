package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1095:Boolean;
      
      private var var_1094:Boolean;
      
      private var var_1361:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return this.var_1095;
      }
      
      public function get hasChangedName() : Boolean
      {
         return this.var_1094;
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return this.var_1361;
      }
      
      public function flush() : Boolean
      {
         this.var_1095 = false;
         this.var_1094 = false;
         this.var_1361 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1095 = param1.readBoolean();
         this.var_1094 = param1.readBoolean();
         this.var_1361 = param1.readBoolean();
         return true;
      }
   }
}
