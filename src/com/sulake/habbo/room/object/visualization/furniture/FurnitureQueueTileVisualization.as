package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const ANIMATION_ID_ROLL:int = 3;
      
      private static const const_1231:int = 2;
      
      private static const const_1230:int = 1;
      
      private static const ANIMATION_DURATION:int = 15;
       
      
      private var var_285:Array;
      
      private var var_1004:int;
      
      public function FurnitureQueueTileVisualization()
      {
         this.var_285 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1231)
         {
            this.var_285 = new Array();
            this.var_285.push(const_1230);
            this.var_1004 = ANIMATION_DURATION;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(this.var_1004 > 0)
         {
            --this.var_1004;
         }
         if(this.var_1004 == 0)
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
