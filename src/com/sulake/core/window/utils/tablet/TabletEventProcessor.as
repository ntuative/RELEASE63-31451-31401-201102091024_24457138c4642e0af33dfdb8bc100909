package com.sulake.core.window.utils.tablet
{
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.MouseEventProcessor;
   
   public class TabletEventProcessor extends MouseEventProcessor
   {
       
      
      private var var_2797:String = "";
      
      public function TabletEventProcessor()
      {
         super();
      }
      
      override public function process(param1:EventProcessorState, param2:IEventQueue) : void
      {
         var_138 = param1.desktop;
         var_79 = param1.var_1211 as WindowController;
         _lastClickTarget = param1.var_1212 as WindowController;
         var_158 = param1.renderer;
         var_788 = param1.var_1209;
         param2.begin();
         param2.end();
         param1.desktop = var_138;
         param1.var_1211 = var_79;
         param1.var_1212 = _lastClickTarget;
         param1.renderer = var_158;
         param1.var_1209 = var_788;
      }
   }
}
