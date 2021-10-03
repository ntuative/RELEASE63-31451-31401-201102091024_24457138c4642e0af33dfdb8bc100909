package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_797:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_555:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_797);
         this.var_555 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return this.var_555;
      }
   }
}
