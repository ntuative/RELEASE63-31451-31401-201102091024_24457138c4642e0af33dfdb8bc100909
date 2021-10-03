package com.sulake.core.assets
{
   import flash.display.DisplayObject;
   
   public class DisplayAsset implements IAsset
   {
       
      
      protected var var_981:String;
      
      protected var var_171:DisplayObject;
      
      protected var _disposed:Boolean = false;
      
      protected var var_787:AssetTypeDeclaration;
      
      public function DisplayAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         this.var_787 = param1;
         this.var_981 = param2;
      }
      
      public function get url() : String
      {
         return this.var_981;
      }
      
      public function get content() : Object
      {
         return this.var_171;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return this.var_787;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            if(this.var_171.loaderInfo != null)
            {
               if(this.var_171.loaderInfo.loader != null)
               {
                  this.var_171.loaderInfo.loader.unload();
               }
            }
            this.var_171 = null;
            this.var_787 = null;
            this._disposed = true;
            this.var_981 = null;
         }
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         if(param1 is DisplayObject)
         {
            this.var_171 = param1 as DisplayObject;
            if(this.var_171 != null)
            {
               return;
            }
            throw new Error("Failed to convert DisplayObject to DisplayAsset!");
         }
         if(param1 is DisplayAsset)
         {
            this.var_171 = DisplayAsset(param1).var_171;
            this.var_787 = DisplayAsset(param1).var_787;
            if(this.var_171 == null)
            {
               throw new Error("Failed to read content from DisplayAsset!");
            }
         }
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is DisplayAsset)
         {
            this.var_171 = DisplayAsset(param1).var_171;
            this.var_787 = DisplayAsset(param1).var_787;
            return;
         }
         throw new Error("Provided asset should be of type DisplayAsset!");
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
   }
}
