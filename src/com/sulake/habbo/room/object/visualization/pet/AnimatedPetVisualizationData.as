package com.sulake.habbo.room.object.visualization.pet
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.habbo.room.object.visualization.furniture.AnimatedFurnitureVisualizationData;
   import com.sulake.habbo.room.object.visualization.furniture.data.SizeData;
   
   public class AnimatedPetVisualizationData extends AnimatedFurnitureVisualizationData
   {
       
      
      private var var_2602:IAssetLibrary = null;
      
      public function AnimatedPetVisualizationData()
      {
         super();
      }
      
      public function set commonAssets(param1:IAssetLibrary) : void
      {
         this.var_2602 = param1;
      }
      
      public function get commonAssets() : IAssetLibrary
      {
         return this.var_2602;
      }
      
      override protected function createSizeData(param1:int, param2:int) : SizeData
      {
         var _loc3_:* = null;
         return new PetAnimationSizeData(param1,param2);
      }
      
      override protected function processVisualizationElement(param1:SizeData, param2:XML) : Boolean
      {
         var _loc3_:* = null;
         if(param1 == null || param2 == null)
         {
            return false;
         }
         switch(String(param2.name()))
         {
            case "postures":
               _loc3_ = param1 as PetAnimationSizeData;
               if(_loc3_ != null)
               {
                  if(!_loc3_.definePostures(param2))
                  {
                     return false;
                  }
               }
               break;
            case "gestures":
               _loc3_ = param1 as PetAnimationSizeData;
               if(_loc3_ != null)
               {
                  if(!_loc3_.defineGestures(param2))
                  {
                     return false;
                  }
               }
               break;
            default:
               if(!super.processVisualizationElement(param1,param2))
               {
                  return false;
               }
               break;
         }
         return true;
      }
      
      public function getAnimationForPosture(param1:int, param2:String) : int
      {
         var _loc3_:PetAnimationSizeData = getSizeData(param1) as PetAnimationSizeData;
         if(_loc3_ != null)
         {
            return _loc3_.getAnimationForPosture(param2);
         }
         return PetAnimationSizeData.const_863;
      }
      
      public function getAnimationForGesture(param1:int, param2:String) : int
      {
         var _loc3_:PetAnimationSizeData = getSizeData(param1) as PetAnimationSizeData;
         if(_loc3_ != null)
         {
            return _loc3_.getAnimationForGesture(param2);
         }
         return PetAnimationSizeData.const_863;
      }
   }
}
