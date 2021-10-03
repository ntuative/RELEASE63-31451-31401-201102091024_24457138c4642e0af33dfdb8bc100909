package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2286:String;
      
      private var var_1610:String;
      
      private var var_2287:String;
      
      private var var_1609:Boolean;
      
      private var var_1608:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2286 = String(param1["set-type"]);
         this.var_1610 = String(param1["flipped-set-type"]);
         this.var_2287 = String(param1["remove-set-type"]);
         this.var_1609 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_1608 >= 0;
      }
      
      public function get staticId() : int
      {
         return this.var_1608;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_1608 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2286;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_1610;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2287;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_1609;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_1609 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_1610 = param1;
      }
   }
}
