package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var _offerId:int;
      
      private var var_1703:String;
      
      private var var_1631:int;
      
      private var var_2194:Boolean;
      
      private var var_2196:Boolean;
      
      private var var_2190:int;
      
      private var var_2193:int;
      
      private var var_2191:int;
      
      private var var_2192:int;
      
      private var var_2195:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this._offerId = param1.readInteger();
         this.var_1703 = param1.readString();
         this.var_1631 = param1.readInteger();
         this.var_2194 = param1.readBoolean();
         this.var_2196 = param1.readBoolean();
         this.var_2190 = param1.readInteger();
         this.var_2193 = param1.readInteger();
         this.var_2191 = param1.readInteger();
         this.var_2192 = param1.readInteger();
         this.var_2195 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get productCode() : String
      {
         return this.var_1703;
      }
      
      public function get price() : int
      {
         return this.var_1631;
      }
      
      public function get upgrade() : Boolean
      {
         return this.var_2194;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2196;
      }
      
      public function get periods() : int
      {
         return this.var_2190;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2193;
      }
      
      public function get year() : int
      {
         return this.var_2191;
      }
      
      public function get month() : int
      {
         return this.var_2192;
      }
      
      public function get day() : int
      {
         return this.var_2195;
      }
   }
}
