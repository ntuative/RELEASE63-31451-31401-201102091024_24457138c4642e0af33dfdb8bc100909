package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class LayerData
   {
      
      public static const const_749:String = "";
      
      public static const const_547:int = 0;
      
      public static const const_461:int = 255;
      
      public static const const_675:Boolean = false;
      
      public static const const_556:int = 0;
      
      public static const const_434:int = 0;
      
      public static const const_501:int = 0;
      
      public static const const_1199:int = 1;
      
      public static const const_1161:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_2098:String = "";
      
      private var var_1575:int = 0;
      
      private var var_2165:int = 255;
      
      private var var_2168:Boolean = false;
      
      private var var_2164:int = 0;
      
      private var var_2166:int = 0;
      
      private var var_2167:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2098 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2098;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_1575 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_1575;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2165 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_2165;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2168 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2168;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2164 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2164;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2166 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_2166;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2167 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2167;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}
