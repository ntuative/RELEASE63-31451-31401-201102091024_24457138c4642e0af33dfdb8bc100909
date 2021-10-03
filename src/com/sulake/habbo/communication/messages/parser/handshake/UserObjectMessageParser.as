package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_630:String;
      
      private var var_924:String;
      
      private var var_2525:String;
      
      private var var_1753:String;
      
      private var var_2524:int;
      
      private var var_2526:String;
      
      private var var_2523:int;
      
      private var var_2527:int;
      
      private var _respectTotal:int;
      
      private var var_1206:int;
      
      private var var_781:int;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_630 = param1.readString();
         this.var_924 = param1.readString();
         this.var_2525 = param1.readString();
         this.var_1753 = param1.readString();
         this.var_2524 = param1.readInteger();
         this.var_2526 = param1.readString();
         this.var_2523 = param1.readInteger();
         this.var_2527 = param1.readInteger();
         this._respectTotal = param1.readInteger();
         this.var_1206 = param1.readInteger();
         this.var_781 = param1.readInteger();
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this.var_630;
      }
      
      public function get sex() : String
      {
         return this.var_924;
      }
      
      public function get customData() : String
      {
         return this.var_2525;
      }
      
      public function get realName() : String
      {
         return this.var_1753;
      }
      
      public function get tickets() : int
      {
         return this.var_2524;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2526;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2523;
      }
      
      public function get directMail() : int
      {
         return this.var_2527;
      }
      
      public function get respectTotal() : int
      {
         return this._respectTotal;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1206;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_781;
      }
   }
}
