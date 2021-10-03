package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_1371:IID;
      
      private var var_1764:String;
      
      private var var_108:IUnknown;
      
      private var var_740:uint;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         this.var_1371 = param1;
         this.var_1764 = getQualifiedClassName(this.var_1371);
         this.var_108 = param2;
         this.var_740 = 0;
      }
      
      public function get iid() : IID
      {
         return this.var_1371;
      }
      
      public function get iis() : String
      {
         return this.var_1764;
      }
      
      public function get unknown() : IUnknown
      {
         return this.var_108;
      }
      
      public function get references() : uint
      {
         return this.var_740;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_108 == null;
      }
      
      public function dispose() : void
      {
         this.var_1371 = null;
         this.var_1764 = null;
         this.var_108 = null;
         this.var_740 = 0;
      }
      
      public function reserve() : uint
      {
         return ++this.var_740;
      }
      
      public function release() : uint
      {
         return this.references > 0 ? uint(--this.var_740) : uint(0);
      }
   }
}
