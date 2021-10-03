package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1115:String = "M";
      
      public static const const_1504:String = "F";
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_168:Number = 0;
      
      private var var_169:Number = 0;
      
      private var var_261:int = 0;
      
      private var _name:String = "";
      
      private var var_2176:int = 0;
      
      private var var_924:String = "";
      
      private var var_630:String = "";
      
      private var var_2177:String = "";
      
      private var var_2180:int;
      
      private var var_2179:int = 0;
      
      private var var_2174:String = "";
      
      private var var_2173:int = 0;
      
      private var var_2175:int = 0;
      
      private var var_2178:String = "";
      
      private var var_164:Boolean = false;
      
      public function UserMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function setReadOnly() : void
      {
         this.var_164 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_164)
         {
            this._x = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_168;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_164)
         {
            this.var_168 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_169;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_164)
         {
            this.var_169 = param1;
         }
      }
      
      public function get dir() : int
      {
         return this.var_261;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_164)
         {
            this.var_261 = param1;
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_164)
         {
            this._name = param1;
         }
      }
      
      public function get userType() : int
      {
         return this.var_2176;
      }
      
      public function set userType(param1:int) : void
      {
         if(!this.var_164)
         {
            this.var_2176 = param1;
         }
      }
      
      public function get sex() : String
      {
         return this.var_924;
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_164)
         {
            this.var_924 = param1;
         }
      }
      
      public function get figure() : String
      {
         return this.var_630;
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_164)
         {
            this.var_630 = param1;
         }
      }
      
      public function get custom() : String
      {
         return this.var_2177;
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_164)
         {
            this.var_2177 = param1;
         }
      }
      
      public function get achievementScore() : int
      {
         return this.var_2180;
      }
      
      public function set achievementScore(param1:int) : void
      {
         if(!this.var_164)
         {
            this.var_2180 = param1;
         }
      }
      
      public function get webID() : int
      {
         return this.var_2179;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_164)
         {
            this.var_2179 = param1;
         }
      }
      
      public function get groupID() : String
      {
         return this.var_2174;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_164)
         {
            this.var_2174 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_2173;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_164)
         {
            this.var_2173 = param1;
         }
      }
      
      public function get xp() : int
      {
         return this.var_2175;
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_164)
         {
            this.var_2175 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_2178;
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_164)
         {
            this.var_2178 = param1;
         }
      }
   }
}
