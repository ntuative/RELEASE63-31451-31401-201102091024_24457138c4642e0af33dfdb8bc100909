package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_780:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         this.var_780 = new ByteArray();
         this.var_780.writeShort(param1);
         this.var_780.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         this.var_780.position = 0;
         if(this.var_780.bytesAvailable)
         {
            _loc1_ = this.var_780.readShort();
            this.var_780.position = 0;
         }
         return _loc1_;
      }
   }
}
