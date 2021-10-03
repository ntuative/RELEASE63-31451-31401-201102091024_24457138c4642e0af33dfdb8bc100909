package com.sulake.habbo.room.object.visualization.furniture.data
{
   import com.sulake.core.utils.Map;
   import com.sulake.room.utils.XMLValidator;
   
   public class AnimationData
   {
      
      public static const const_1936:int = 0;
      
      private static const TRANSITION_TO_ANIMATION_OFFSET:int = 1000000;
      
      private static const TRANSITION_FROM_ANIMATION_OFFSET:int = 2000000;
       
      
      private var var_115:Map = null;
      
      private var var_421:int = -1;
      
      private var var_1650:Boolean = false;
      
      public function AnimationData()
      {
         super();
         this.var_115 = new Map();
      }
      
      public static function getTransitionToAnimationId(param1:int) : int
      {
         return TRANSITION_TO_ANIMATION_OFFSET + param1;
      }
      
      public static function getTransitionFromAnimationId(param1:int) : int
      {
         return TRANSITION_FROM_ANIMATION_OFFSET + param1;
      }
      
      public static function isTransitionToAnimation(param1:int) : Boolean
      {
         return param1 >= TRANSITION_TO_ANIMATION_OFFSET && param1 < TRANSITION_FROM_ANIMATION_OFFSET;
      }
      
      public static function isTransitionFromAnimation(param1:int) : Boolean
      {
         return param1 >= TRANSITION_FROM_ANIMATION_OFFSET;
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(this.var_115 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this.var_115.length)
            {
               _loc2_ = this.var_115.getWithIndex(_loc1_) as AnimationLayerData;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            this.var_115.dispose();
            this.var_115 = null;
         }
      }
      
      public function getStartFrame(param1:int) : int
      {
         if(!this.var_1650)
         {
            return 0;
         }
         return Math.random() * this.var_421;
      }
      
      public function initialize(param1:XML) : Boolean
      {
         var _loc3_:* = null;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Boolean = false;
         this.var_1650 = false;
         _loc3_ = param1.@randomStart;
         if(_loc3_.length() == 1)
         {
            if(int(_loc3_) != 0)
            {
               this.var_1650 = true;
            }
         }
         var _loc2_:* = ["id"];
         _loc3_ = null;
         var _loc4_:XMLList = param1.animationLayer;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length())
         {
            _loc6_ = _loc4_[_loc5_];
            if(!XMLValidator.checkRequiredAttributes(_loc6_,_loc2_))
            {
               return false;
            }
            _loc7_ = int(_loc6_.@id);
            _loc8_ = 1;
            _loc9_ = 1;
            _loc10_ = false;
            _loc3_ = _loc6_.@loopCount;
            if(_loc3_.length() == 1)
            {
               _loc8_ = int(_loc3_);
            }
            _loc3_ = _loc6_.@frameRepeat;
            if(_loc3_.length() == 1)
            {
               _loc9_ = int(_loc3_);
            }
            _loc3_ = _loc6_.@random;
            if(_loc3_.length() == 1)
            {
               if(int(_loc3_) != 0)
               {
                  _loc10_ = true;
               }
            }
            if(!this.addLayer(_loc7_,_loc8_,_loc9_,_loc10_,_loc6_))
            {
               return false;
            }
            _loc5_++;
         }
         return true;
      }
      
      private function addLayer(param1:int, param2:int, param3:int, param4:Boolean, param5:XML) : Boolean
      {
         var _loc12_:* = null;
         var _loc13_:int = 0;
         var _loc14_:Boolean = false;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:int = 0;
         var _loc18_:* = null;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc6_:AnimationLayerData = new AnimationLayerData(param2,param3,param4);
         var _loc7_:* = ["id"];
         var _loc8_:* = null;
         var _loc9_:XMLList = param5.frameSequence;
         var _loc10_:int = 0;
         while(_loc10_ < _loc9_.length())
         {
            _loc12_ = _loc9_[_loc10_];
            _loc13_ = 1;
            _loc14_ = false;
            _loc8_ = _loc12_.@loopCount;
            if(_loc8_.length() == 1)
            {
               _loc13_ = int(_loc8_);
            }
            _loc8_ = _loc12_.@random;
            if(_loc8_.length() == 1)
            {
               if(int(_loc8_) != 0)
               {
                  _loc14_ = true;
               }
            }
            _loc15_ = _loc6_.addFrameSequence(_loc13_,_loc14_);
            _loc16_ = _loc12_.frame;
            _loc17_ = 0;
            while(_loc17_ < _loc16_.length())
            {
               _loc18_ = _loc16_[_loc17_];
               if(!XMLValidator.checkRequiredAttributes(_loc18_,_loc7_))
               {
                  _loc6_.dispose();
                  return false;
               }
               _loc19_ = int(_loc18_.@id);
               _loc20_ = 0;
               _loc21_ = 0;
               _loc22_ = 0;
               _loc23_ = 0;
               _loc8_ = _loc18_.@x;
               if(_loc8_.length() == 1)
               {
                  _loc20_ = int(_loc8_);
               }
               _loc8_ = _loc18_.@y;
               if(_loc8_.length() == 1)
               {
                  _loc21_ = int(_loc8_);
               }
               _loc8_ = _loc18_.@randomX;
               if(_loc8_.length() == 1)
               {
                  _loc22_ = int(_loc8_);
               }
               _loc8_ = _loc18_.@randomY;
               if(_loc8_.length() == 1)
               {
                  _loc23_ = int(_loc8_);
               }
               _loc15_.addFrame(_loc19_,_loc20_,_loc21_,_loc22_,_loc23_);
               _loc17_++;
            }
            _loc15_.initialize();
            _loc10_++;
         }
         _loc6_.calculateLength();
         this.var_115.add(param1,_loc6_);
         var _loc11_:int = _loc6_.frameCount;
         if(_loc11_ > this.var_421)
         {
            this.var_421 = _loc11_;
         }
         return true;
      }
      
      public function getFrame(param1:int, param2:int, param3:int) : AnimationFrame
      {
         var _loc4_:AnimationLayerData = this.var_115.getValue(param2) as AnimationLayerData;
         if(_loc4_ != null)
         {
            return _loc4_.getFrame(param3);
         }
         return null;
      }
      
      public function getFrameFromSequence(param1:int, param2:int, param3:int, param4:int, param5:int) : AnimationFrame
      {
         var _loc6_:AnimationLayerData = this.var_115.getValue(param2) as AnimationLayerData;
         if(_loc6_ != null)
         {
            return _loc6_.getFrameFromSequence(param3,param4,param5);
         }
         return null;
      }
   }
}
