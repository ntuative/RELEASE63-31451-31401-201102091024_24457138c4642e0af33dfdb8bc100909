package com.sulake.room.object.visualization.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import flash.display.BitmapData;
   
   public class GraphicAsset implements IGraphicAsset
   {
       
      
      private var var_1695:String;
      
      private var var_2504:String;
      
      private var var_386:IAsset;
      
      private var var_1311:Boolean;
      
      private var var_1310:Boolean;
      
      private var var_2505:Boolean;
      
      private var _offsetX:int;
      
      private var var_1077:int;
      
      private var _width:int;
      
      private var _height:int;
      
      public function GraphicAsset(param1:String, param2:String, param3:IAsset, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:Boolean = false)
      {
         var _loc10_:* = null;
         super();
         this.var_1695 = param1;
         this.var_2504 = param2;
         var _loc9_:BitmapDataAsset = param3 as BitmapDataAsset;
         if(_loc9_ != null)
         {
            _loc10_ = _loc9_.content as BitmapData;
         }
         if(_loc10_ != null)
         {
            this.var_386 = param3;
            this._width = _loc10_.width;
            this._height = _loc10_.height;
         }
         else
         {
            this.var_386 = null;
            this._width = 0;
            this._height = 0;
         }
         this.var_1311 = param4;
         this.var_1310 = param5;
         this._offsetX = param6;
         this.var_1077 = param7;
         this.var_2505 = param8;
      }
      
      public function dispose() : void
      {
         this.var_386 = null;
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1310;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1311;
      }
      
      public function get assetName() : String
      {
         return this.var_1695;
      }
      
      public function get libraryAssetName() : String
      {
         return this.var_2504;
      }
      
      public function get asset() : IAsset
      {
         return this.var_386;
      }
      
      public function get usesPalette() : Boolean
      {
         return this.var_2505;
      }
      
      public function get offsetX() : int
      {
         if(!this.var_1311)
         {
            return this._offsetX;
         }
         return -(this._width + this._offsetX);
      }
      
      public function get offsetY() : int
      {
         if(!this.var_1310)
         {
            return this.var_1077;
         }
         return -(this._height + this.var_1077);
      }
      
      public function get originalOffsetX() : int
      {
         return this._offsetX;
      }
      
      public function get originalOffsetY() : int
      {
         return this.var_1077;
      }
   }
}
