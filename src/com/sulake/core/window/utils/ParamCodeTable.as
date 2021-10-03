package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_180;
         param1["bound_to_parent_rect"] = const_95;
         param1["child_window"] = const_1149;
         param1["embedded_controller"] = const_1081;
         param1["resize_to_accommodate_children"] = const_69;
         param1["input_event_processor"] = const_30;
         param1["internal_event_handling"] = const_620;
         param1["mouse_dragging_target"] = const_233;
         param1["mouse_dragging_trigger"] = const_396;
         param1["mouse_scaling_target"] = const_305;
         param1["mouse_scaling_trigger"] = const_500;
         param1["horizontal_mouse_scaling_trigger"] = const_248;
         param1["vertical_mouse_scaling_trigger"] = const_253;
         param1["observe_parent_input_events"] = const_1128;
         param1["optimize_region_to_layout_size"] = const_432;
         param1["parent_window"] = const_1024;
         param1["relative_horizontal_scale_center"] = const_166;
         param1["relative_horizontal_scale_fixed"] = const_140;
         param1["relative_horizontal_scale_move"] = const_344;
         param1["relative_horizontal_scale_strech"] = WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_STRECH;
         param1["relative_scale_center"] = const_1061;
         param1["relative_scale_fixed"] = const_888;
         param1["relative_scale_move"] = const_998;
         param1["relative_scale_strech"] = const_1130;
         param1["relative_vertical_scale_center"] = const_168;
         param1["relative_vertical_scale_fixed"] = const_136;
         param1["relative_vertical_scale_move"] = const_391;
         param1["relative_vertical_scale_strech"] = const_334;
         param1["on_resize_align_left"] = const_753;
         param1["on_resize_align_right"] = const_496;
         param1["on_resize_align_center"] = const_490;
         param1["on_resize_align_top"] = const_743;
         param1["on_resize_align_bottom"] = const_467;
         param1["on_resize_align_middle"] = const_521;
         param1["on_accommodate_align_left"] = const_1091;
         param1["on_accommodate_align_right"] = const_574;
         param1["on_accommodate_align_center"] = const_872;
         param1["on_accommodate_align_top"] = const_1183;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_855;
         param1["route_input_events_to_parent"] = const_557;
         param1["use_parent_graphic_context"] = const_32;
         param1["draggable_with_mouse"] = const_996;
         param1["scalable_with_mouse"] = const_993;
         param1["reflect_horizontal_resize_to_parent"] = const_527;
         param1["reflect_vertical_resize_to_parent"] = const_420;
         param1["reflect_resize_to_parent"] = const_286;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
