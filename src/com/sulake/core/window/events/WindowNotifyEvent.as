package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1600:String = "WN_CRETAE";
      
      public static const const_1384:String = "WN_CREATED";
      
      public static const const_1042:String = "WN_DESTROY";
      
      public static const const_1100:String = "WN_DESTROYED";
      
      public static const const_982:String = "WN_OPEN";
      
      public static const const_1141:String = "WN_OPENED";
      
      public static const const_1097:String = "WN_CLOSE";
      
      public static const const_1094:String = "WN_CLOSED";
      
      public static const const_969:String = "WN_FOCUS";
      
      public static const const_1145:String = "WN_FOCUSED";
      
      public static const const_964:String = "WN_UNFOCUS";
      
      public static const const_1182:String = "WN_UNFOCUSED";
      
      public static const const_1134:String = "WN_ACTIVATE";
      
      public static const const_337:String = "WN_ACTVATED";
      
      public static const const_1021:String = "WN_DEACTIVATE";
      
      public static const const_1101:String = "WN_DEACTIVATED";
      
      public static const const_455:String = "WN_SELECT";
      
      public static const const_352:String = "WN_SELECTED";
      
      public static const const_799:String = "WN_UNSELECT";
      
      public static const const_757:String = "WN_UNSELECTED";
      
      public static const const_984:String = "WN_LOCK";
      
      public static const const_1003:String = "WN_LOCKED";
      
      public static const const_991:String = "WN_UNLOCK";
      
      public static const const_1127:String = "WN_UNLOCKED";
      
      public static const const_1079:String = "WN_ENABLE";
      
      public static const const_694:String = "WN_ENABLED";
      
      public static const const_1184:String = "WN_DISABLE";
      
      public static const const_711:String = "WN_DISABLED";
      
      public static const const_698:String = "WN_RESIZE";
      
      public static const const_183:String = "WN_RESIZED";
      
      public static const const_1025:String = "WN_RELOCATE";
      
      public static const const_524:String = "WN_RELOCATED";
      
      public static const const_989:String = "WN_MINIMIZE";
      
      public static const const_1014:String = "WN_MINIMIZED";
      
      public static const const_1113:String = "WN_MAXIMIZE";
      
      public static const const_1088:String = "WN_MAXIMIZED";
      
      public static const const_1174:String = "WN_RESTORE";
      
      public static const const_1140:String = "WN_RESTORED";
      
      public static const const_1738:String = "WN_ARRANGE";
      
      public static const const_1935:String = "WN_ARRANGED";
      
      public static const const_1827:String = "WN_UPDATE";
      
      public static const const_1879:String = "WN_UPDATED";
      
      public static const const_402:String = "WN_CHILD_ADDED";
      
      public static const const_677:String = "WN_CHILD_REMOVED";
      
      public static const const_278:String = "WN_CHILD_RESIZED";
      
      public static const const_302:String = "WN_CHILD_RELOCATED";
      
      public static const const_268:String = "WN_CHILD_ACTIVATED";
      
      public static const const_558:String = "WN_PARENT_ADDED";
      
      public static const const_1010:String = "WN_PARENT_REMOVED";
      
      public static const const_452:String = "WN_PARENT_RESIZED";
      
      public static const const_1041:String = "WN_PARENT_RELOCATED";
      
      public static const const_660:String = "WN_PARENT_ACTIVATED";
      
      public static const const_451:String = "WN_STATE_UPDATED";
      
      public static const const_507:String = "WN_STYLE_UPDATED";
      
      public static const const_536:String = "WN_PARAM_UPDATED";
      
      public static const const_1921:String = "";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1966,cancelable);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
   }
}
