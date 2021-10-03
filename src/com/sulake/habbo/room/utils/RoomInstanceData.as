package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_698:TileHeightMap = null;
      
      private var var_1061:LegacyWallGeometry = null;
      
      private var var_1062:RoomCamera = null;
      
      private var var_700:SelectedRoomObjectData = null;
      
      private var var_699:SelectedRoomObjectData = null;
      
      private var var_2333:String = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         this._roomId = param1;
         this._roomCategory = param2;
         this.var_1061 = new LegacyWallGeometry();
         this.var_1062 = new RoomCamera();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return this.var_698;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(this.var_698 != null)
         {
            this.var_698.dispose();
         }
         this.var_698 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return this.var_1061;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return this.var_1062;
      }
      
      public function get worldType() : String
      {
         return this.var_2333;
      }
      
      public function set worldType(param1:String) : void
      {
         this.var_2333 = param1;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return this.var_700;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_700 != null)
         {
            this.var_700.dispose();
         }
         this.var_700 = param1;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return this.var_699;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_699 != null)
         {
            this.var_699.dispose();
         }
         this.var_699 = param1;
      }
      
      public function dispose() : void
      {
         if(this.var_698 != null)
         {
            this.var_698.dispose();
            this.var_698 = null;
         }
         if(this.var_1061 != null)
         {
            this.var_1061.dispose();
            this.var_1061 = null;
         }
         if(this.var_1062 != null)
         {
            this.var_1062.dispose();
            this.var_1062 = null;
         }
         if(this.var_700 != null)
         {
            this.var_700.dispose();
            this.var_700 = null;
         }
         if(this.var_699 != null)
         {
            this.var_699.dispose();
            this.var_699 = null;
         }
      }
   }
}
