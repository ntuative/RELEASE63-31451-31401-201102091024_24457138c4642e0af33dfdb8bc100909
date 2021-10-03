package com.sulake.core.window.services
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.components.IToolTipWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowType;
   import flash.display.DisplayObject;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class WindowToolTipAgent extends WindowMouseOperator implements IToolTipAgentService
   {
       
      
      protected var var_1221:String;
      
      protected var var_266:IToolTipWindow;
      
      protected var var_372:Timer;
      
      protected var var_1219:Point;
      
      protected var var_1220:Point;
      
      protected var var_1477:uint;
      
      public function WindowToolTipAgent(param1:DisplayObject)
      {
         this.var_1220 = new Point();
         this.var_1219 = new Point(20,20);
         this.var_1477 = 500;
         super(param1);
      }
      
      override public function begin(param1:IWindow, param2:uint = 0) : IWindow
      {
         if(param1 && !param1.disposed)
         {
            if(param1 is IInteractiveWindow)
            {
               this.var_1221 = IInteractiveWindow(param1).toolTipCaption;
               this.var_1477 = IInteractiveWindow(param1).toolTipDelay;
            }
            else
            {
               this.var_1221 = param1.caption;
               this.var_1477 = 500;
            }
            _mouse.x = var_137.mouseX;
            _mouse.y = var_137.mouseY;
            getMousePositionRelativeTo(param1,_mouse,this.var_1220);
            if(this.var_1221 != null && this.var_1221 != "")
            {
               if(this.var_372 == null)
               {
                  this.var_372 = new Timer(this.var_1477,1);
                  this.var_372.addEventListener(TimerEvent.TIMER,this.showToolTip);
               }
               this.var_372.reset();
               this.var_372.start();
            }
         }
         return super.begin(param1,param2);
      }
      
      override public function end(param1:IWindow) : IWindow
      {
         if(this.var_372 != null)
         {
            this.var_372.stop();
            this.var_372.removeEventListener(TimerEvent.TIMER,this.showToolTip);
            this.var_372 = null;
         }
         this.hideToolTip();
         return super.end(param1);
      }
      
      override public function operate(param1:int, param2:int) : void
      {
         if(_window && true)
         {
            _mouse.x = param1;
            _mouse.y = param2;
            getMousePositionRelativeTo(_window,_mouse,this.var_1220);
            if(this.var_266 != null && !this.var_266.disposed)
            {
               this.var_266.x = param1 + this.var_1219.x;
               this.var_266.y = param2 + this.var_1219.y;
            }
         }
      }
      
      protected function showToolTip(param1:TimerEvent) : void
      {
         var _loc2_:* = null;
         if(this.var_372 != null)
         {
            this.var_372.reset();
         }
         if(_window && true)
         {
            if(this.var_266 == null || this.var_266.disposed)
            {
               this.var_266 = _window.context.create("undefined::ToolTip",this.var_1221,WindowType.const_347,_window.style,0 | 0,null,null,null,0,null,null) as IToolTipWindow;
            }
            _loc2_ = new Point();
            _window.getGlobalPosition(_loc2_);
            this.var_266.x = _loc2_.x + this.var_1220.x + this.var_1219.x;
            this.var_266.y = _loc2_.y + this.var_1220.y + this.var_1219.y;
         }
      }
      
      protected function hideToolTip() : void
      {
         if(this.var_266 != null && !this.var_266.disposed)
         {
            this.var_266.destroy();
            this.var_266 = null;
         }
      }
   }
}
