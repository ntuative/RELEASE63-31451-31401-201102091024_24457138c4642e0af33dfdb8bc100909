package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
   public class MoveFurniTo extends DefaultActionType
   {
       
      
      public function MoveFurniTo()
      {
         super();
      }
      
      override public function get code() : int
      {
         return ActionTypeCodes.var_1938;
      }
      
      override public function get requiresFurni() : Boolean
      {
         return true;
      }
   }
}
