package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_259:String = "ROE_MOUSE_CLICK";
      
      public static const const_1913:String = "ROE_MOUSE_ENTER";
      
      public static const const_565:String = "ROE_MOUSE_MOVE";
      
      public static const const_1887:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1757:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_568:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1873:String = "";
      
      private var var_2121:Boolean;
      
      private var var_2117:Boolean;
      
      private var var_2120:Boolean;
      
      private var var_2119:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:String, param3:int, param4:String, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false)
      {
         super(param1,param3,param4,param9,param10);
         this.var_1873 = param2;
         this.var_2121 = param5;
         this.var_2117 = param6;
         this.var_2120 = param7;
         this.var_2119 = param8;
      }
      
      public function get eventId() : String
      {
         return this.var_1873;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2121;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2117;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2120;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2119;
      }
   }
}
