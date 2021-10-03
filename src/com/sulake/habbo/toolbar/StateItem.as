package com.sulake.habbo.toolbar
{
   public class StateItem
   {
       
      
      private var _id:String;
      
      private var var_1387:Boolean;
      
      private var var_2593:Boolean;
      
      private var var_193:int = 120;
      
      private var var_1830:String;
      
      private var var_1368:String = "-1";
      
      private var var_1791:String = "-1";
      
      private var var_1829:String = "-1";
      
      private var var_2592:String;
      
      private var var_436:String;
      
      private var _frames:XMLList;
      
      private var var_344:String;
      
      public function StateItem(param1:XML, param2:String)
      {
         super();
         this._id = param1.@id;
         if(param1.attribute("loop").length() > 0)
         {
            this.var_1387 = Boolean(param1.@loop);
         }
         if(param1.attribute("bounce").length() > 0)
         {
            this.var_2593 = Boolean(param1.@loop);
         }
         if(param1.attribute("timer").length() > 0)
         {
            this.var_193 = int(param1.@timer);
         }
         if(param1.attribute("namebase").length() > 0)
         {
            this.var_1830 = param1.@namebase;
         }
         else
         {
            this.var_1830 = param2;
         }
         if(param1.attribute("state_over").length() > 0)
         {
            this.var_1368 = param1.@state_over;
         }
         if(param1.attribute("nextState").length() > 0)
         {
            this.var_1791 = param1.@nextState;
         }
         else
         {
            this.var_1791 = this._id;
         }
         if(param1.attribute("state_default").length() > 0)
         {
            this.var_1829 = param1.@state_default;
         }
         if(param1.attribute("tooltip").length() > 0)
         {
            this.var_2592 = param1.@tooltip;
         }
         if(param1.attribute("background").length() > 0)
         {
            this.var_436 = param1.@background;
         }
         var _loc3_:XMLList = param1.elements("frame");
         if(_loc3_.length() > 0)
         {
            this._frames = _loc3_;
         }
         if(param1.attribute("label").length() > 0)
         {
            this.var_344 = param1.@label;
         }
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get loop() : Boolean
      {
         return this.var_1387;
      }
      
      public function get bounce() : Boolean
      {
         return this.var_2593;
      }
      
      public function get timer() : int
      {
         return this.var_193;
      }
      
      public function get nameBase() : String
      {
         return this.var_1830;
      }
      
      public function get hasStateOver() : Boolean
      {
         return this.var_1368 != "-1";
      }
      
      public function get stateOver() : String
      {
         return this.var_1368;
      }
      
      public function get nextState() : String
      {
         return this.var_1791;
      }
      
      public function get hasDefaultState() : Boolean
      {
         return this.var_1829 != "-1";
      }
      
      public function get defaultState() : String
      {
         return this.var_1829;
      }
      
      public function get tooltip() : String
      {
         return this.var_2592;
      }
      
      public function get frames() : XMLList
      {
         return this._frames;
      }
      
      public function get background() : String
      {
         return this.var_436;
      }
      
      public function get label() : String
      {
         return this.var_344;
      }
   }
}
