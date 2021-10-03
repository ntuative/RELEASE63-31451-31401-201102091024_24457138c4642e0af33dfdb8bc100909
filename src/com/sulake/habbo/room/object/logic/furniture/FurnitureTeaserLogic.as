package com.sulake.habbo.room.object.logic.furniture
{
   import com.sulake.habbo.room.events.RoomObjectFurnitureActionEvent;
   import com.sulake.habbo.room.events.RoomObjectWidgetRequestEvent;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.events.MouseEvent;
   
   public class FurnitureTeaserLogic extends FurnitureLogic
   {
       
      
      private const const_1987:String = "TYPE_INJECTED";
      
      public function FurnitureTeaserLogic()
      {
         super();
      }
      
      override public function mouseEvent(param1:RoomSpriteMouseEvent, param2:IRoomGeometry) : void
      {
         var _loc6_:* = null;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc10_:* = null;
         if(param1 == null || param2 == null)
         {
            return;
         }
         if(object == null)
         {
            return;
         }
         if(param1.type != MouseEvent.CLICK && param1.type != MouseEvent.DOUBLE_CLICK && param1.type != MouseEvent.MOUSE_DOWN && param1.type != MouseEvent.MOUSE_UP)
         {
            return;
         }
         var _loc3_:IRoomObjectModelController = object.getModelController();
         var _loc4_:String = _loc3_.getString(RoomObjectVariableEnum.const_93);
         var _loc5_:String = _loc4_;
         if(_loc4_)
         {
            if(_loc4_.indexOf("+") > -1)
            {
               _loc5_ = _loc4_.substring(0,_loc4_.indexOf("+"));
               _loc6_ = _loc4_.substring(_loc4_.indexOf("+") + 1,_loc4_.length);
            }
         }
         if(_loc5_ == this.const_1987)
         {
            if(param1.type == MouseEvent.MOUSE_UP)
            {
               if(eventDispatcher != null)
               {
                  _loc8_ = object.getId();
                  _loc9_ = object.getType();
                  _loc10_ = new RoomObjectWidgetRequestEvent(RoomObjectWidgetRequestEvent.const_126,_loc8_,_loc9_);
                  eventDispatcher.dispatchEvent(_loc10_);
                  object.setVisualization(null);
               }
            }
            else
            {
               super.mouseEvent(param1,param2);
            }
         }
         else if(param1.type == MouseEvent.DOUBLE_CLICK)
         {
            if(eventDispatcher != null)
            {
               _loc8_ = object.getId();
               _loc9_ = object.getType();
               _loc10_ = new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.const_519,_loc8_,_loc9_);
               eventDispatcher.dispatchEvent(_loc10_);
            }
         }
         else if(param1.type == MouseEvent.MOUSE_DOWN || param1.type == MouseEvent.CLICK)
         {
            super.mouseEvent(param1,param2);
         }
      }
   }
}
