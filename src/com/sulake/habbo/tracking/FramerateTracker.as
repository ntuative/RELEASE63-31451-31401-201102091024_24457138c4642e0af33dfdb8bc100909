package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1531:int;
      
      private var var_2239:int;
      
      private var var_1034:int;
      
      private var var_447:Number;
      
      private var var_2241:Boolean;
      
      private var var_2240:int;
      
      private var var_1593:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2239 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2240 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2241 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         ++this.var_1034;
         if(this.var_1034 == 1)
         {
            this.var_447 = param1;
            this.var_1531 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_1034);
            this.var_447 = this.var_447 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2241 && param3 - this.var_1531 >= this.var_2239 && this.var_1593 < this.var_2240)
         {
            _loc5_ = 1000 / this.var_447;
            param2.track("performance","averageFramerate",Math.round(_loc5_));
            ++this.var_1593;
            this.var_1531 = param3;
            this.var_1034 = 0;
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
