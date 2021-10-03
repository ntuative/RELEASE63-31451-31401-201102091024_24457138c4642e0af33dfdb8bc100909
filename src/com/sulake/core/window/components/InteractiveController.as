package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.enum.MouseCursorType;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.utils.PropertyDefaults;
   import com.sulake.core.window.utils.PropertyStruct;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class InteractiveController extends WindowController implements IInteractiveWindow
   {
      
      protected static var var_270:Array;
       
      
      protected var var_2741:uint = 0;
      
      protected var var_438:Array;
      
      protected var var_1477:uint = 500;
      
      protected var var_1221:String = "";
      
      public function InteractiveController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         param4 |= 0;
         this.var_438 = new Array();
         this.var_438[0] = MouseCursorType.const_346;
         this.var_438[1] = MouseCursorType.const_31;
         this.var_438[2] = MouseCursorType.const_346;
         this.var_438[3] = MouseCursorType.const_346;
         this.var_438[4] = MouseCursorType.const_31;
         this.var_438[5] = MouseCursorType.const_31;
         this.var_438[6] = MouseCursorType.const_346;
         if(var_270 == null)
         {
            var_270 = new Array();
            var_270[0] = WindowState.const_101;
            var_270[1] = WindowState.const_81;
            var_270[2] = WindowState.const_84;
            var_270[3] = WindowState.const_72;
            var_270[4] = WindowState.const_49;
            var_270[5] = WindowState.const_89;
            var_270[6] = WindowState.const_77;
         }
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
      }
      
      public static function processInteractiveWindowEvents(param1:IInteractiveWindow, param2:Event) : void
      {
         if(param1.toolTipCaption != PropertyDefaults.const_417)
         {
            if(param2.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
            {
               param1.context.getWindowServices().getToolTipAgentService().begin(param1);
            }
            else if(param2.type != WindowMouseEvent.const_176)
            {
               if(param2.type == WindowMouseEvent.const_25)
               {
                  param1.context.getWindowServices().getToolTipAgentService().end(param1);
               }
            }
         }
      }
      
      public static function readInteractiveWindowProperties(param1:IInteractiveWindow, param2:Array) : void
      {
         var _loc3_:* = null;
         for each(_loc3_ in param2)
         {
            switch(_loc3_.key)
            {
               case PropertyDefaults.const_765:
                  if(_loc3_.value != param1.toolTipCaption)
                  {
                     param1.toolTipCaption = _loc3_.value as String;
                  }
                  break;
               case PropertyDefaults.const_880:
                  if(_loc3_.value != param1.toolTipDelay)
                  {
                     param1.toolTipDelay = _loc3_.value as uint;
                  }
                  break;
               case "mouse_cursor_hovering":
                  param1.setMouseCursorByState(WindowState.const_84,_loc3_.value as uint);
                  break;
               case "mouse_cursor_pressed":
                  param1.setMouseCursorByState(WindowState.const_89,_loc3_.value as uint);
                  break;
               case "mouse_cursor_disabled":
                  param1.setMouseCursorByState(WindowState.const_77,_loc3_.value as uint);
                  break;
            }
         }
      }
      
      public static function writeInteractiveWindowProperties(param1:IInteractiveWindow, param2:Array) : Array
      {
         if(param1.toolTipCaption != PropertyDefaults.const_417)
         {
            param2.push(new PropertyStruct(PropertyDefaults.const_765,param1.toolTipCaption,PropertyStruct.const_51,true));
         }
         else
         {
            param2.push(PropertyDefaults.const_1573);
         }
         if(param1.toolTipDelay != PropertyDefaults.TOOL_TIP_DELAY_VALUE)
         {
            param2.push(new PropertyStruct(PropertyDefaults.const_880,param1.toolTipDelay,PropertyStruct.const_212,true));
         }
         else
         {
            param2.push(PropertyDefaults.const_1530);
         }
         return param2;
      }
      
      public function set mouseCursorType(param1:uint) : void
      {
         this.var_2741 = param1;
      }
      
      public function get mouseCursorType() : uint
      {
         return this.var_2741;
      }
      
      public function set toolTipCaption(param1:String) : void
      {
         this.var_1221 = param1 == null ? "null" : param1;
      }
      
      public function get toolTipCaption() : String
      {
         return this.var_1221;
      }
      
      public function set toolTipDelay(param1:uint) : void
      {
         this.var_1477 = param1;
      }
      
      public function get toolTipDelay() : uint
      {
         return this.var_1477;
      }
      
      override public function update(param1:WindowController, param2:Event) : Boolean
      {
         if(param1 == this)
         {
            processInteractiveWindowEvents(this,param2);
         }
         return super.update(param1,param2);
      }
      
      public function showToolTip(param1:IToolTipWindow) : void
      {
      }
      
      public function hideToolTip() : void
      {
      }
      
      public function setMouseCursorByState(param1:uint, param2:uint) : void
      {
         var _loc3_:int = var_270.indexOf(param1);
         if(_loc3_ > -1)
         {
            this.var_438[_loc3_] = param2;
         }
      }
      
      public function getMouseCursorByState(param1:uint) : uint
      {
         var _loc2_:int = 0;
         while(_loc2_-- > 0)
         {
            if((param1 & 0) > 0)
            {
               return this.var_438[_loc2_];
            }
         }
         return MouseCursorType.const_31;
      }
      
      override public function get properties() : Array
      {
         return writeInteractiveWindowProperties(this,super.properties);
      }
      
      override public function set properties(param1:Array) : void
      {
         readInteractiveWindowProperties(this,param1);
         super.properties = param1;
      }
   }
}
