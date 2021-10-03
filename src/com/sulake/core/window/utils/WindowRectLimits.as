package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   
   public class WindowRectLimits implements IRectLimiter
   {
       
      
      private var var_275:int = -2.147483648E9;
      
      private var var_273:int = 2.147483647E9;
      
      private var var_276:int = -2.147483648E9;
      
      private var var_274:int = 2.147483647E9;
      
      private var _target:IWindow;
      
      public function WindowRectLimits(param1:IWindow)
      {
         super();
         this._target = param1;
      }
      
      public function get minWidth() : int
      {
         return this.var_275;
      }
      
      public function get maxWidth() : int
      {
         return this.var_273;
      }
      
      public function get minHeight() : int
      {
         return this.var_276;
      }
      
      public function get maxHeight() : int
      {
         return this.var_274;
      }
      
      public function set minWidth(param1:int) : void
      {
         this.var_275 = param1;
         if(this.var_275 > int.MIN_VALUE && !this._target.disposed && this._target.width < this.var_275)
         {
            this._target.width = this.var_275;
         }
      }
      
      public function set maxWidth(param1:int) : void
      {
         this.var_273 = param1;
         if(this.var_273 < int.MAX_VALUE && !this._target.disposed && this._target.width > this.var_273)
         {
            this._target.width = this.var_273;
         }
      }
      
      public function set minHeight(param1:int) : void
      {
         this.var_276 = param1;
         if(this.var_276 > int.MIN_VALUE && !this._target.disposed && this._target.height < this.var_276)
         {
            this._target.height = this.var_276;
         }
      }
      
      public function set maxHeight(param1:int) : void
      {
         this.var_274 = param1;
         if(this.var_274 < int.MAX_VALUE && !this._target.disposed && this._target.height > this.var_274)
         {
            this._target.height = this.var_274;
         }
      }
      
      public function get isEmpty() : Boolean
      {
         return this.var_275 == int.MIN_VALUE && this.var_273 == int.MAX_VALUE && this.var_276 == int.MIN_VALUE && this.var_274 == int.MAX_VALUE;
      }
      
      public function setEmpty() : void
      {
         this.var_275 = int.MIN_VALUE;
         this.var_273 = int.MAX_VALUE;
         this.var_276 = int.MIN_VALUE;
         this.var_274 = int.MAX_VALUE;
      }
      
      public function limit() : void
      {
         if(!this.isEmpty && this._target)
         {
            if(this._target.width < this.var_275)
            {
               this._target.width = this.var_275;
            }
            else if(this._target.width > this.var_273)
            {
               this._target.width = this.var_273;
            }
            if(this._target.height < this.var_276)
            {
               this._target.height = this.var_276;
            }
            else if(this._target.height > this.var_274)
            {
               this._target.height = this.var_274;
            }
         }
      }
      
      public function assign(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.var_275 = param1;
         this.var_273 = param2;
         this.var_276 = param3;
         this.var_274 = param4;
         this.limit();
      }
      
      public function clone(param1:IWindow) : WindowRectLimits
      {
         var _loc2_:WindowRectLimits = new WindowRectLimits(param1);
         _loc2_.var_275 = this.var_275;
         _loc2_.var_273 = this.var_273;
         _loc2_.var_276 = this.var_276;
         _loc2_.var_274 = this.var_274;
         return _loc2_;
      }
   }
}
