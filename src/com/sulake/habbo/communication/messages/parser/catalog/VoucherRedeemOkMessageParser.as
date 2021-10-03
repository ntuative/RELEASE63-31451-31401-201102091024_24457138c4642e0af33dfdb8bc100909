package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoucherRedeemOkMessageParser implements IMessageParser
   {
       
      
      private var var_884:String = "";
      
      private var var_1091:String = "";
      
      public function VoucherRedeemOkMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_1091 = "";
         this.var_884 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1091 = param1.readString();
         this.var_884 = param1.readString();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_884;
      }
      
      public function get productDescription() : String
      {
         return this.var_1091;
      }
   }
}
