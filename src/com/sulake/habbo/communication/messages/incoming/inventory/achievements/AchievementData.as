package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1293:int;
      
      private var var_286:String;
      
      private var var_2716:int;
      
      private var var_2231:int;
      
      private var var_1588:int;
      
      private var var_2715:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1293 = param1.readInteger();
         this.var_286 = param1.readString();
         this.var_2716 = param1.readInteger();
         this.var_2231 = param1.readInteger();
         this.var_1588 = param1.readInteger();
         this.var_2715 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_286;
      }
      
      public function get level() : int
      {
         return this.var_1293;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_2716;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2231;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1588;
      }
      
      public function get currentPoints() : int
      {
         return this.var_2715;
      }
   }
}
