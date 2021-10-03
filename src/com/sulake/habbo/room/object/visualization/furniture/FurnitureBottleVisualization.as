package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_909:int = 20;
      
      private static const const_581:int = 9;
      
      private static const ANIMATION_ID_ROLL:int = -1;
       
      
      private var var_285:Array;
      
      private var var_745:Boolean = false;
      
      public function FurnitureBottleVisualization()
      {
         this.var_285 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!this.var_745)
            {
               this.var_745 = true;
               this.var_285 = new Array();
               this.var_285.push(ANIMATION_ID_ROLL);
               return;
            }
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(this.var_745)
            {
               this.var_745 = false;
               this.var_285 = new Array();
               this.var_285.push(const_909);
               this.var_285.push(const_581 + param1);
               this.var_285.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(super.getLastFramePlayed(0))
         {
            if(this.var_285.length > 0)
            {
               super.setAnimation(this.var_285.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
