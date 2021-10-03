package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_727:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_977:String = "inventory_effects";
      
      public static const const_1122:String = "inventory_badges";
      
      public static const const_1379:String = "inventory_clothes";
      
      public static const const_1487:String = "inventory_furniture";
       
      
      private var var_2300:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_727);
         this.var_2300 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2300;
      }
   }
}
