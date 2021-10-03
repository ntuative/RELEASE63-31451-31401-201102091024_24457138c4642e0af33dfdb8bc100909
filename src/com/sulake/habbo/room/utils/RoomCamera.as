package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_898:int = 3;
       
      
      private var var_2063:int = -1;
      
      private var var_2056:int = -2;
      
      private var var_315:Vector3d = null;
      
      private var var_378:Vector3d = null;
      
      private var var_2054:Boolean = false;
      
      private var var_2061:Boolean = false;
      
      private var var_2057:Boolean = false;
      
      private var var_2055:Boolean = false;
      
      private var var_2060:int = 0;
      
      private var var_2059:int = 0;
      
      private var var_2062:int = 0;
      
      private var var_2058:int = 0;
      
      private var var_1255:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get location() : IVector3d
      {
         return this.var_378;
      }
      
      public function get targetId() : int
      {
         return this.var_2063;
      }
      
      public function get targetCategory() : int
      {
         return this.var_2056;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_2054;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this.var_2061;
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_2057;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_2055;
      }
      
      public function get screenWd() : int
      {
         return this.var_2060;
      }
      
      public function get screenHt() : int
      {
         return this.var_2059;
      }
      
      public function get roomWd() : int
      {
         return this.var_2062;
      }
      
      public function get roomHt() : int
      {
         return this.var_2058;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_2063 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_2056 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_2054 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this.var_2061 = param1;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_2057 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_2055 = param1;
      }
      
      public function set screenWd(param1:int) : void
      {
         this.var_2060 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_2059 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_2062 = param1;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_2058 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(this.var_315 == null)
         {
            this.var_315 = new Vector3d();
         }
         if(this.var_315.x != param1.x || this.var_315.y != param1.y || this.var_315.z != param1.z)
         {
            this.var_315.assign(param1);
            this.var_1255 = 0;
         }
      }
      
      public function dispose() : void
      {
         this.var_315 = null;
         this.var_378 = null;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_378 != null)
         {
            return;
         }
         this.var_378 = new Vector3d();
         this.var_378.assign(param1);
      }
      
      public function update(param1:uint, param2:Number, param3:Number) : void
      {
         var _loc4_:* = null;
         if(this.var_315 != null && this.var_378 != null)
         {
            ++this.var_1255;
            _loc4_ = Vector3d.dif(this.var_315,this.var_378);
            if(_loc4_.length <= param2)
            {
               this.var_378 = this.var_315;
               this.var_315 = null;
            }
            else
            {
               _loc4_.div(_loc4_.length);
               if(_loc4_.length < param2 * (const_898 + 1))
               {
                  _loc4_.mul(param2);
               }
               else if(this.var_1255 <= const_898)
               {
                  _loc4_.mul(param2);
               }
               else
               {
                  _loc4_.mul(param3);
               }
               this.var_378 = Vector3d.sum(this.var_378,_loc4_);
            }
         }
      }
   }
}
