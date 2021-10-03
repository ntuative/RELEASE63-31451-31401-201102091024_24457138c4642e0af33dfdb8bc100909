package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_909:int = 20;
      
      private static const const_581:int = 10;
      
      private static const const_1243:int = 31;
      
      private static const ANIMATION_ID_ROLL:int = 32;
      
      private static const ANIMATION_ID_OFF:int = 30;
       
      
      private var var_285:Array;
      
      private var var_745:Boolean = false;
      
      public function FurnitureValRandomizerVisualization()
      {
         this.var_285 = new Array();
         super();
         super.setAnimation(ANIMATION_ID_OFF);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            if(!this.var_745)
            {
               this.var_745 = true;
               this.var_285 = new Array();
               this.var_285.push(const_1243);
               this.var_285.push(ANIMATION_ID_ROLL);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_581)
         {
            if(this.var_745)
            {
               this.var_745 = false;
               this.var_285 = new Array();
               if(_direction == 2)
               {
                  this.var_285.push(const_909 + 5 - param1);
                  this.var_285.push(const_581 + 5 - param1);
               }
               else
               {
                  this.var_285.push(const_909 + param1);
                  this.var_285.push(const_581 + param1);
               }
               this.var_285.push(ANIMATION_ID_OFF);
               return;
            }
            super.setAnimation(ANIMATION_ID_OFF);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(super.getLastFramePlayed(11))
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
