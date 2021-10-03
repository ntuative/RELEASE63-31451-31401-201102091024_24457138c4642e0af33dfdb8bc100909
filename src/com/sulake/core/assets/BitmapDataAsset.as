package com.sulake.core.assets
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class BitmapDataAsset implements ILazyAsset
   {
      
      protected static var var_529:uint = 0;
      
      protected static var var_500:uint = 0;
       
      
      private var _disposed:Boolean = false;
      
      private var var_108:Object;
      
      private var _bitmap:BitmapData;
      
      private var _offset:Point;
      
      private var var_1311:Boolean = false;
      
      private var var_1310:Boolean = false;
      
      private var var_1586:AssetTypeDeclaration;
      
      private var var_981:String;
      
      public function BitmapDataAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         this._offset = new Point(0,0);
         super();
         this.var_1586 = param1;
         this.var_981 = param2;
         ++var_529;
      }
      
      public static function get instances() : uint
      {
         return var_529;
      }
      
      public static function get allocatedByteCount() : uint
      {
         return var_500;
      }
      
      public function get url() : String
      {
         return this.var_981;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1311;
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1310;
      }
      
      public function get offset() : Point
      {
         return this._offset;
      }
      
      public function get content() : Object
      {
         if(!this._bitmap)
         {
            this.prepareLazyContent();
         }
         return this._bitmap;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return this.var_1586;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            --var_529;
            if(this._bitmap)
            {
               try
               {
                  var_500 -= this._bitmap.width * this._bitmap.height * 4;
                  this._bitmap.dispose();
               }
               catch(e:Error)
               {
               }
            }
            this.var_108 = null;
            this._bitmap = null;
            this._offset = null;
            this.var_1586 = null;
            this.var_981 = null;
            this._disposed = true;
         }
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         this.var_108 = param1;
         this._bitmap = null;
      }
      
      public function prepareLazyContent() : void
      {
         var _loc1_:* = null;
         if(this.var_108 is Class)
         {
            _loc1_ = new this.var_108() as Bitmap;
            if(_loc1_ != null)
            {
               this._bitmap = _loc1_.bitmapData.clone();
               _loc1_.bitmapData.dispose();
               if(this._bitmap != null)
               {
                  var_500 += this._bitmap.width * this._bitmap.height * 4;
                  this.var_108 = null;
                  return;
               }
               throw new Error("Failed to convert Bitmap Class to BitmapDataAsset!");
            }
            this._bitmap = new this.var_108() as BitmapData;
            if(this._bitmap != null)
            {
               this.var_108 = null;
               return;
            }
            throw new Error("Failed to convert BitmapData Class to BitmapDataAsset!");
         }
         if(this.var_108 is Bitmap)
         {
            this._bitmap = Bitmap(this.var_108).bitmapData;
            if(this._bitmap == null)
            {
               throw new Error("Failed to convert Bitmap to BitmapDataAsset!");
            }
            this.var_108 = null;
         }
         if(this.var_108 is BitmapData)
         {
            this._bitmap = this.var_108 as BitmapData;
            if(this._bitmap != null)
            {
               this.var_108 = null;
               return;
            }
            throw new Error("Failed to convert BitmapData to BitmapDataAsset!");
         }
         if(this.var_108 is BitmapDataAsset)
         {
            this._bitmap = BitmapDataAsset(this.var_108)._bitmap;
            this._offset = BitmapDataAsset(this.var_108)._offset;
            this.var_1311 = BitmapDataAsset(this.var_108).var_1311;
            this.var_1310 = BitmapDataAsset(this.var_108).var_1310;
            if(this._bitmap != null)
            {
               this.var_108 = null;
               return;
            }
            throw new Error("Failed to read content from BitmaDataAsset!");
         }
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is BitmapDataAsset)
         {
            this._bitmap = BitmapDataAsset(param1)._bitmap;
            this._offset = BitmapDataAsset(param1)._offset;
            return;
         }
         throw new Error("Provided asset should be of type BitmapDataAsset!");
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length())
         {
            _loc3_ = param1[_loc2_].attribute("key");
            _loc4_ = param1[_loc2_].attribute("value");
            switch(_loc3_)
            {
               case "offset":
                  _loc5_ = _loc4_.split(",");
                  this._offset.x = parseInt(_loc5_[0]);
                  this._offset.y = parseInt(_loc5_[1]);
                  break;
               case "flipH":
                  this.var_1311 = _loc4_ == "1" || _loc4_ == "true";
                  break;
               case "flipV":
                  this.var_1310 = _loc4_ == "1" || _loc4_ == "true";
                  break;
            }
            _loc2_++;
         }
      }
   }
}
