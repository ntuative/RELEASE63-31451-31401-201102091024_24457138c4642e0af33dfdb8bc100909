package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1569:IID;
      
      private var var_737:Boolean;
      
      private var var_1021:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_1569 = param1;
         this.var_1021 = new Array();
         this.var_737 = false;
      }
      
      public function get identifier() : IID
      {
         return this.var_1569;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_737;
      }
      
      public function get receivers() : Array
      {
         return this.var_1021;
      }
      
      public function dispose() : void
      {
         if(!this.var_737)
         {
            this.var_737 = true;
            this.var_1569 = null;
            while(this.var_1021.length > 0)
            {
               this.var_1021.pop();
            }
            this.var_1021 = null;
         }
      }
   }
}
