package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDataProvider;
   
   public class EffectListProxy implements IThumbListDataProvider
   {
       
      
      private var var_64:EffectsModel;
      
      private var var_364:int;
      
      public function EffectListProxy(param1:EffectsModel, param2:int)
      {
         super();
         this.var_64 = param1;
         this.var_364 = param2;
      }
      
      public function dispose() : void
      {
         this.var_64 = null;
      }
      
      public function getDrawableList() : Array
      {
         return this.var_64.getEffects(this.var_364);
      }
   }
}
