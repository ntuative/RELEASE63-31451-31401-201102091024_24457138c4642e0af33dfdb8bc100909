package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_933:BigInteger;
      
      private var var_2572:BigInteger;
      
      private var var_1844:BigInteger;
      
      private var var_2612:BigInteger;
      
      private var var_1435:BigInteger;
      
      private var var_1845:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1435 = param1;
         this.var_1845 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1435.toString() + ",generator: " + this.var_1845.toString() + ",secret: " + param1);
         this.var_933 = new BigInteger();
         this.var_933.fromRadix(param1,param2);
         this.var_2572 = this.var_1845.modPow(this.var_933,this.var_1435);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1844 = new BigInteger();
         this.var_1844.fromRadix(param1,param2);
         this.var_2612 = this.var_1844.modPow(this.var_933,this.var_1435);
         return this.getSharedKey(param2);
      }
      
      public function method_5(param1:uint = 16) : String
      {
         return this.var_2572.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2612.toRadix(param1);
      }
   }
}
