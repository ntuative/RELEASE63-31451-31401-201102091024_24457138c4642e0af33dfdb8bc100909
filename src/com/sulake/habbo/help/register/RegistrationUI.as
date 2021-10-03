package com.sulake.habbo.help.register
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.habbo.communication.messages.outgoing.help.SendRegistrationDataComposer;
   import com.sulake.habbo.help.HabboHelp;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.window.IHabboWindowManager;
   
   public class RegistrationUI
   {
       
      
      private var var_180:HabboHelp;
      
      private var var_957:RegistrationView;
      
      public function RegistrationUI(param1:HabboHelp)
      {
         super();
         this.var_180 = param1;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this.var_180.windowManager;
      }
      
      public function get assets() : IAssetLibrary
      {
         return this.var_180.assets;
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this.var_180.localization;
      }
      
      public function get myName() : String
      {
         return this.var_180.ownUserName;
      }
      
      public function dispose() : void
      {
         this.var_180 = null;
         if(this.var_957)
         {
            this.var_957.dispose();
            this.var_957 = null;
         }
      }
      
      public function showRegistrationView() : void
      {
         if(!this.var_957)
         {
            this.var_957 = new RegistrationView(this);
         }
         this.var_957.showMainView();
      }
      
      public function sendRegistrationEmail(param1:String, param2:String, param3:Boolean) : void
      {
         this.var_180.sendMessage(new SendRegistrationDataComposer(param1,param2,param3));
      }
   }
}
