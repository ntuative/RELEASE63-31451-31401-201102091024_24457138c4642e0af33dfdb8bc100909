package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2136:int;
      
      private var var_2135:int;
      
      private var var_2137:String;
      
      private var var_2138:int;
      
      private var var_2134:Boolean;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         this._roomId = param6;
         this._roomCategory = param7;
         this.var_2136 = param1;
         this.var_2135 = param2;
         this.var_2137 = param3;
         this.var_2138 = param4;
         this.var_2134 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2136,this.var_2135,this.var_2137,this.var_2138,int(this.var_2134)];
      }
      
      public function dispose() : void
      {
      }
   }
}
