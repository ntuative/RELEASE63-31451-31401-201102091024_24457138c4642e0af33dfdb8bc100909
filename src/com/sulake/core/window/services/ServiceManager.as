package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices, IDisposable
   {
       
      
      private var var_2771:uint;
      
      private var var_137:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      private var _windowContext:IWindowContext;
      
      private var var_1154:IMouseDraggingService;
      
      private var var_1155:IMouseScalingService;
      
      private var var_1156:IMouseListenerService;
      
      private var var_1157:IFocusManagerService;
      
      private var var_1152:IToolTipAgentService;
      
      private var var_1153:IGestureAgentService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_2771 = 0;
         this.var_137 = param2;
         this._windowContext = param1;
         this.var_1154 = new WindowMouseDragger(param2);
         this.var_1155 = new WindowMouseScaler(param2);
         this.var_1156 = new WindowMouseListener(param2);
         this.var_1157 = new FocusManager(param2);
         this.var_1152 = new WindowToolTipAgent(param2);
         this.var_1153 = new GestureAgentService();
      }
      
      public function dispose() : void
      {
         if(this.var_1154 != null)
         {
            this.var_1154.dispose();
            this.var_1154 = null;
         }
         if(this.var_1155 != null)
         {
            this.var_1155.dispose();
            this.var_1155 = null;
         }
         if(this.var_1156 != null)
         {
            this.var_1156.dispose();
            this.var_1156 = null;
         }
         if(this.var_1157 != null)
         {
            this.var_1157.dispose();
            this.var_1157 = null;
         }
         if(this.var_1152 != null)
         {
            this.var_1152.dispose();
            this.var_1152 = null;
         }
         if(this.var_1153 != null)
         {
            this.var_1153.dispose();
            this.var_1153 = null;
         }
         this.var_137 = null;
         this._windowContext = null;
         this._disposed = true;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_1154;
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_1155;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_1156;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_1157;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_1152;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_1153;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
   }
}
