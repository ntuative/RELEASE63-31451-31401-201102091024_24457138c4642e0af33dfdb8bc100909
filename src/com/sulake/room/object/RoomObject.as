package com.sulake.room.object
{
   import com.sulake.room.object.logic.IRoomObjectEventHandler;
   import com.sulake.room.object.logic.IRoomObjectMouseHandler;
   import com.sulake.room.object.visualization.IRoomObjectVisualization;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObject implements IRoomObjectController
   {
      
      private static var var_1025:int = 0;
       
      
      private var _id:int;
      
      private var _type:String = "";
      
      private var var_78:Vector3d;
      
      private var var_261:Vector3d;
      
      private var var_1891:Vector3d;
      
      private var var_1892:Vector3d;
      
      private var var_627:Array;
      
      private var var_64:RoomObjectModel;
      
      private var _visualization:IRoomObjectVisualization;
      
      private var var_626:IRoomObjectEventHandler;
      
      private var _updateID:int;
      
      private var _instanceId:int = 0;
      
      public function RoomObject(param1:int, param2:int)
      {
         super();
         this._id = param1;
         this.var_78 = new Vector3d();
         this.var_261 = new Vector3d();
         this.var_1891 = new Vector3d();
         this.var_1892 = new Vector3d();
         this.var_627 = new Array(param2);
         var _loc3_:Number = param2 - 1;
         while(_loc3_ >= 0)
         {
            this.var_627[_loc3_] = 0;
            _loc3_--;
         }
         this.var_64 = new RoomObjectModel();
         this._visualization = null;
         this.var_626 = null;
         this._updateID = 0;
         this._instanceId = var_1025++;
      }
      
      public function dispose() : void
      {
         this.var_78 = null;
         this.var_261 = null;
         if(this.var_64 != null)
         {
            this.var_64.dispose();
            this.var_64 = null;
         }
         this.var_627 = null;
         this.setVisualization(null);
         this.setEventHandler(null);
      }
      
      public function getId() : int
      {
         return this._id;
      }
      
      public function getType() : String
      {
         return this._type;
      }
      
      public function getInstanceId() : int
      {
         return this._instanceId;
      }
      
      public function getLocation() : IVector3d
      {
         this.var_1891.assign(this.var_78);
         return this.var_1891;
      }
      
      public function getDirection() : IVector3d
      {
         this.var_1892.assign(this.var_261);
         return this.var_1892;
      }
      
      public function getModel() : IRoomObjectModel
      {
         return this.var_64;
      }
      
      public function getModelController() : IRoomObjectModelController
      {
         return this.var_64;
      }
      
      public function getState(param1:int) : int
      {
         if(param1 >= 0 && param1 < this.var_627.length)
         {
            return this.var_627[param1];
         }
         return -1;
      }
      
      public function getVisualization() : IRoomObjectVisualization
      {
         return this._visualization;
      }
      
      public function setType(param1:String) : void
      {
         this._type = param1;
      }
      
      public function setLocation(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(this.var_78.x != param1.x || this.var_78.y != param1.y || this.var_78.z != param1.z)
         {
            this.var_78.x = param1.x;
            this.var_78.y = param1.y;
            this.var_78.z = param1.z;
            ++this._updateID;
         }
      }
      
      public function setDirection(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(this.var_261.x != param1.x || this.var_261.y != param1.y || this.var_261.z != param1.z)
         {
            this.var_261.x = (param1.x % 360 + 360) % 360;
            this.var_261.y = (param1.y % 360 + 360) % 360;
            this.var_261.z = (param1.z % 360 + 360) % 360;
            ++this._updateID;
         }
      }
      
      public function setState(param1:int, param2:int) : Boolean
      {
         if(param2 >= 0 && param2 < this.var_627.length)
         {
            if(this.var_627[param2] != param1)
            {
               this.var_627[param2] = param1;
               ++this._updateID;
            }
            return true;
         }
         return false;
      }
      
      public function setVisualization(param1:IRoomObjectVisualization) : void
      {
         if(param1 != this._visualization)
         {
            if(this._visualization != null)
            {
               this._visualization.dispose();
            }
            this._visualization = param1;
            if(this._visualization != null)
            {
               this._visualization.object = this;
            }
         }
      }
      
      public function setEventHandler(param1:IRoomObjectEventHandler) : void
      {
         if(param1 == this.var_626)
         {
            return;
         }
         var _loc2_:IRoomObjectEventHandler = this.var_626;
         if(_loc2_ != null)
         {
            this.var_626 = null;
            _loc2_.object = null;
         }
         this.var_626 = param1;
         if(this.var_626 != null)
         {
            this.var_626.object = this;
         }
      }
      
      public function getEventHandler() : IRoomObjectEventHandler
      {
         return this.var_626;
      }
      
      public function getUpdateID() : int
      {
         return this._updateID;
      }
      
      public function getMouseHandler() : IRoomObjectMouseHandler
      {
         return this.getEventHandler();
      }
   }
}
