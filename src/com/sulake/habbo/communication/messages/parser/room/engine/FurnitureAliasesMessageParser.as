package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.core.utils.Map;
   
   public class FurnitureAliasesMessageParser implements IMessageParser
   {
       
      
      private var var_550:Map = null;
      
      public function FurnitureAliasesMessageParser()
      {
         super();
         this.var_550 = new Map();
      }
      
      public function get aliasCount() : int
      {
         return this.var_550.length;
      }
      
      public function getName(param1:int) : String
      {
         if(param1 < 0 || param1 >= this.aliasCount)
         {
            return null;
         }
         return this.var_550.getKey(param1);
      }
      
      public function getAlias(param1:int) : String
      {
         if(param1 < 0 || param1 >= this.aliasCount)
         {
            return null;
         }
         return this.var_550.getWithIndex(param1);
      }
      
      public function flush() : Boolean
      {
         this.var_550.reset();
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         this.var_550.reset();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            _loc5_ = param1.readString();
            this.var_550.remove(_loc4_);
            this.var_550.add(_loc4_,_loc5_);
            _loc3_++;
         }
         return true;
      }
   }
}
