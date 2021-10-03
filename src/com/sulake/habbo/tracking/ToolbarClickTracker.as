package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class ToolbarClickTracker
   {
       
      
      private var var_1234:IHabboTracking;
      
      private var var_1761:Boolean = false;
      
      private var var_2169:int = 0;
      
      private var var_1574:int = 0;
      
      public function ToolbarClickTracker(param1:IHabboTracking)
      {
         super();
         this.var_1234 = param1;
      }
      
      public function dispose() : void
      {
         this.var_1234 = null;
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_1761 = Boolean(parseInt(param1.getKey("toolbar.tracking.enabled","1")));
         this.var_2169 = parseInt(param1.getKey("toolbar.tracking.max.events","100"));
      }
      
      public function track(param1:String) : void
      {
         if(!this.var_1761)
         {
            return;
         }
         ++this.var_1574;
         if(this.var_1574 <= this.var_2169)
         {
            this.var_1234.track("toolbar",param1);
         }
      }
   }
}
