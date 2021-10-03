package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_873:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_2136:int;
      
      private var var_2135:int;
      
      private var _color:uint;
      
      private var var_1192:int;
      
      private var var_2401:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_873);
         this.var_2136 = param1;
         this.var_2135 = param2;
         this._color = param3;
         this.var_1192 = param4;
         this.var_2401 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2136;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2135;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_1192;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2401;
      }
   }
}
