package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_2021:Number = 0.0;
      
      private var var_2022:Number = 0.0;
      
      private var var_2171:Number = 0.0;
      
      private var var_2170:Number = 0.0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2021 = param1;
         this.var_2022 = param2;
         this.var_2171 = param3;
         this.var_2170 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2021;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2022;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2171;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2170;
      }
   }
}
