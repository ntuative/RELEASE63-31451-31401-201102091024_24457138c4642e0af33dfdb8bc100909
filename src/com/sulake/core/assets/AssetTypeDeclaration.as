package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2026:String;
      
      private var var_2024:Class;
      
      private var var_2025:Class;
      
      private var var_1502:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         this.var_2026 = param1;
         this.var_2024 = param2;
         this.var_2025 = param3;
         if(rest == null)
         {
            this.var_1502 = new Array();
         }
         else
         {
            this.var_1502 = rest;
         }
      }
      
      public function get mimeType() : String
      {
         return this.var_2026;
      }
      
      public function get assetClass() : Class
      {
         return this.var_2024;
      }
      
      public function get loaderClass() : Class
      {
         return this.var_2025;
      }
      
      public function get fileTypes() : Array
      {
         return this.var_1502;
      }
   }
}
