package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_1618:String = "WE_CREATE";
      
      public static const const_1455:String = "WE_CREATED";
      
      public static const const_1375:String = "WE_DESTROY";
      
      public static const const_309:String = "WE_DESTROYED";
      
      public static const const_1480:String = "WE_OPEN";
      
      public static const const_1636:String = "WE_OPENED";
      
      public static const const_1542:String = "WE_CLOSE";
      
      public static const const_1446:String = "WE_CLOSED";
      
      public static const const_1402:String = "WE_FOCUS";
      
      public static const const_279:String = "WE_FOCUSED";
      
      public static const const_1576:String = "WE_UNFOCUS";
      
      public static const const_1594:String = "WE_UNFOCUSED";
      
      public static const const_1483:String = "WE_ACTIVATE";
      
      public static const const_1449:String = "WE_ACTIVATED";
      
      public static const const_1623:String = "WE_DEACTIVATE";
      
      public static const const_667:String = "WE_DEACTIVATED";
      
      public static const const_555:String = "WE_SELECT";
      
      public static const const_59:String = "WE_SELECTED";
      
      public static const const_686:String = "WE_UNSELECT";
      
      public static const const_804:String = "WE_UNSELECTED";
      
      public static const const_1876:String = "WE_ATTACH";
      
      public static const const_1752:String = "WE_ATTACHED";
      
      public static const const_1855:String = "WE_DETACH";
      
      public static const const_1922:String = "WE_DETACHED";
      
      public static const const_1470:String = "WE_LOCK";
      
      public static const const_1368:String = "WE_LOCKED";
      
      public static const const_1373:String = "WE_UNLOCK";
      
      public static const const_1354:String = "WE_UNLOCKED";
      
      public static const const_624:String = "WE_ENABLE";
      
      public static const const_284:String = "WE_ENABLED";
      
      public static const const_625:String = "WE_DISABLE";
      
      public static const const_234:String = "WE_DISABLED";
      
      public static const const_1589:String = "WE_RELOCATE";
      
      public static const const_377:String = "WE_RELOCATED";
      
      public static const const_1441:String = "WE_RESIZE";
      
      public static const const_45:String = "WE_RESIZED";
      
      public static const const_1535:String = "WE_MINIMIZE";
      
      public static const const_1442:String = "WE_MINIMIZED";
      
      public static const const_1524:String = "WE_MAXIMIZE";
      
      public static const const_1577:String = "WE_MAXIMIZED";
      
      public static const const_1356:String = "WE_RESTORE";
      
      public static const const_1495:String = "WE_RESTORED";
      
      public static const const_1760:String = "WE_ARRANGE";
      
      public static const const_1759:String = "WE_ARRANGED";
      
      public static const const_105:String = "WE_UPDATE";
      
      public static const const_1863:String = "WE_UPDATED";
      
      public static const const_1842:String = "WE_CHILD_RELOCATE";
      
      public static const const_540:String = "WE_CHILD_RELOCATED";
      
      public static const const_1898:String = "WE_CHILD_RESIZE";
      
      public static const const_276:String = "WE_CHILD_RESIZED";
      
      public static const const_1840:String = "WE_CHILD_REMOVE";
      
      public static const const_438:String = "WE_CHILD_REMOVED";
      
      public static const const_1929:String = "WE_PARENT_RELOCATE";
      
      public static const const_1776:String = "WE_PARENT_RELOCATED";
      
      public static const const_1753:String = "WE_PARENT_RESIZE";
      
      public static const const_1610:String = "WE_PARENT_RESIZED";
      
      public static const const_165:String = "WE_OK";
      
      public static const const_750:String = "WE_CANCEL";
      
      public static const const_103:String = "WE_CHANGE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_466:String = "WE_SCROLL";
      
      public static const const_151:String = "";
       
      
      protected var _type:String = "";
      
      protected var _window:IWindow;
      
      protected var var_1966:IWindow;
      
      protected var var_1965:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         this._type = param1;
         this._window = param2;
         this.var_1966 = param3;
         this.var_1965 = false;
         super(param1,param4,param5);
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      override public function get type() : String
      {
         return this._type;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_1966;
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(this._type,this.window,this.related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            this.var_1965 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1965;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
   }
}
