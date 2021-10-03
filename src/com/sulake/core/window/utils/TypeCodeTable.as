package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_668;
         param1["bitmap"] = const_865;
         param1["border"] = const_759;
         param1["border_notify"] = const_1549;
         param1["button"] = const_532;
         param1["button_thick"] = const_605;
         param1["button_icon"] = const_1544;
         param1["button_group_left"] = const_712;
         param1["button_group_center"] = const_861;
         param1["button_group_right"] = const_811;
         param1["canvas"] = const_771;
         param1["checkbox"] = const_800;
         param1["closebutton"] = const_979;
         param1["container"] = const_362;
         param1["container_button"] = const_881;
         param1["display_object_wrapper"] = const_689;
         param1["dropmenu"] = const_550;
         param1["dropmenu_item"] = const_548;
         param1["frame"] = const_354;
         param1["frame_notify"] = const_1581;
         param1["header"] = const_666;
         param1["html"] = const_1044;
         param1["icon"] = const_1111;
         param1["itemgrid"] = const_1153;
         param1["itemgrid_horizontal"] = const_436;
         param1["itemgrid_vertical"] = const_879;
         param1["itemlist"] = const_1031;
         param1["itemlist_horizontal"] = const_336;
         param1["itemlist_vertical"] = const_345;
         param1["label"] = WINDOW_TYPE_LABEL;
         param1["maximizebox"] = const_1459;
         param1["menu"] = const_1430;
         param1["menu_item"] = const_1400;
         param1["submenu"] = const_1171;
         param1["minimizebox"] = const_1398;
         param1["notify"] = const_1408;
         param1["null"] = const_869;
         param1["password"] = const_704;
         param1["radiobutton"] = const_676;
         param1["region"] = const_732;
         param1["restorebox"] = const_1617;
         param1["scaler"] = const_792;
         param1["scaler_horizontal"] = const_1411;
         param1["scaler_vertical"] = const_1514;
         param1["scrollbar_horizontal"] = const_430;
         param1["scrollbar_vertical"] = const_844;
         param1["scrollbar_slider_button_up"] = const_1159;
         param1["scrollbar_slider_button_down"] = const_1038;
         param1["scrollbar_slider_button_left"] = const_1054;
         param1["scrollbar_slider_button_right"] = const_1121;
         param1["scrollbar_slider_bar_horizontal"] = const_971;
         param1["scrollbar_slider_bar_vertical"] = const_1139;
         param1["scrollbar_slider_track_horizontal"] = const_987;
         param1["scrollbar_slider_track_vertical"] = const_1008;
         param1["scrollable_itemlist"] = const_1361;
         param1["scrollable_itemlist_vertical"] = const_486;
         param1["scrollable_itemlist_horizontal"] = const_1181;
         param1["selector"] = const_823;
         param1["selector_list"] = const_678;
         param1["submenu"] = const_1171;
         param1["tab_button"] = const_567;
         param1["tab_container_button"] = const_1177;
         param1["tab_context"] = const_359;
         param1["tab_content"] = const_1201;
         param1["tab_selector"] = const_609;
         param1["text"] = const_505;
         param1["input"] = const_714;
         param1["toolbar"] = const_1605;
         param1["tooltip"] = const_347;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
