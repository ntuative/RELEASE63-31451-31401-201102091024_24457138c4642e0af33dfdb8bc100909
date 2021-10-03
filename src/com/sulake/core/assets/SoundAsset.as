package com.sulake.core.assets
{
   import flash.media.Sound;
   import flash.utils.ByteArray;
   
   public class SoundAsset implements IAsset
   {
       
      
      private var _disposed:Boolean = false;
      
      private var var_171:Sound = null;
      
      private var var_1586:AssetTypeDeclaration;
      
      private var var_981:String;
      
      public function SoundAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         this.var_1586 = param1;
         this.var_981 = param2;
      }
      
      public function get url() : String
      {
         return this.var_981;
      }
      
      public function get content() : Object
      {
         return this.var_171 as Object;
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
            this._disposed = true;
            this.var_171 = null;
            this.var_1586 = null;
            this.var_981 = null;
         }
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         if(param1 is Sound)
         {
            if(this.var_171)
            {
               this.var_171.close();
            }
            this.var_171 = param1 as Sound;
            return;
         }
         if(param1 is ByteArray)
         {
         }
         if(param1 is Class)
         {
            if(this.var_171)
            {
               this.var_171.close();
            }
            this.var_171 = new param1() as Sound;
            return;
         }
         if(param1 is SoundAsset)
         {
            if(this.var_171)
            {
               this.var_171.close();
            }
            this.var_171 = SoundAsset(param1).var_171;
            return;
         }
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is SoundAsset)
         {
            this.var_171 = SoundAsset(param1).var_171;
         }
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
   }
}
