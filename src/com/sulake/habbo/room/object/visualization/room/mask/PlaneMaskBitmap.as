package com.sulake.habbo.room.object.visualization.room.mask
{
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   
   public class PlaneMaskBitmap
   {
      
      public static const const_53:Number = -1;
      
      public static const MAX_NORMAL_COORDINATE_VALUE:Number = 1;
       
      
      private var var_386:IGraphicAsset = null;
      
      private var var_2264:Number = -1.0;
      
      private var _normalMaxX:Number = 1.0;
      
      private var var_2265:Number = -1.0;
      
      private var var_2266:Number = 1.0;
      
      public function PlaneMaskBitmap(param1:IGraphicAsset, param2:Number = -1.0, param3:Number = 1.0, param4:Number = -1.0, param5:Number = 1.0)
      {
         super();
         this.var_2264 = param2;
         this._normalMaxX = param3;
         this.var_2265 = param4;
         this.var_2266 = param5;
         this.var_386 = param1;
      }
      
      public function get asset() : IGraphicAsset
      {
         return this.var_386;
      }
      
      public function get normalMinX() : Number
      {
         return this.var_2264;
      }
      
      public function get normalMaxX() : Number
      {
         return this._normalMaxX;
      }
      
      public function get normalMinY() : Number
      {
         return this.var_2265;
      }
      
      public function get normalMaxY() : Number
      {
         return this.var_2266;
      }
      
      public function dispose() : void
      {
         this.var_386 = null;
      }
   }
}
