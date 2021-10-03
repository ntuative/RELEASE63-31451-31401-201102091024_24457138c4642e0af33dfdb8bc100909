package com.sulake.habbo.avatar
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import flash.display.BitmapData;
   
   public class PlaceholderAvatarImage extends AvatarImage
   {
      
      static var var_774:Map = new Map();
       
      
      public function PlaceholderAvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:AvatarFigureContainer, param4:String)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(!var_737)
         {
            _structure = null;
            _assets = null;
            var_234 = null;
            var_269 = null;
            var_630 = null;
            var_528 = null;
            var_308 = null;
            if(!var_1233 && var_43)
            {
               var_43.dispose();
            }
            var_43 = null;
            _loc1_ = getCache();
            if(_loc1_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_770 = null;
            var_737 = true;
         }
      }
      
      override protected function getFullImage(param1:String) : BitmapData
      {
         return var_774[param1];
      }
      
      override protected function cacheFullImage(param1:String, param2:BitmapData) : void
      {
         var_774[param1] = param2;
      }
      
      override public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = rest[0];
         }
         switch(param1)
         {
            case AvatarAction.const_341:
               switch(_loc3_)
               {
                  case AvatarAction.const_826:
                  case AvatarAction.const_465:
                  case AvatarAction.const_388:
                  case AvatarAction.const_697:
                  case AvatarAction.const_353:
                  case AvatarAction.const_773:
                     super.appendAction.apply(null,[param1].concat(rest));
               }
               break;
            case AvatarAction.const_315:
            case AvatarAction.const_830:
            case AvatarAction.const_216:
            case AvatarAction.const_741:
            case AvatarAction.const_747:
            case AvatarAction.const_766:
               super.addActionData.apply(null,[param1].concat(rest));
         }
         return true;
      }
      
      override public function isPlaceholder() : Boolean
      {
         return true;
      }
   }
}
