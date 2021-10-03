package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_379:int = 1;
      
      public static const const_255:int = 2;
      
      public static const const_298:int = 3;
      
      public static const const_358:int = 4;
      
      public static const const_264:int = 5;
      
      public static const const_332:int = 1;
      
      public static const const_758:int = 2;
      
      public static const const_785:int = 3;
      
      public static const const_696:int = 4;
      
      public static const const_254:int = 5;
      
      public static const const_634:int = 6;
      
      public static const const_638:int = 7;
      
      public static const const_244:int = 8;
      
      public static const const_393:int = 9;
      
      public static const const_1789:int = 10;
      
      public static const const_739:int = 11;
      
      public static const const_494:int = 12;
       
      
      private var var_391:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_391 = new Array();
         this.var_391.push(new Tab(this._navigator,const_379,const_494,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_474));
         this.var_391.push(new Tab(this._navigator,const_255,const_332,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_474));
         this.var_391.push(new Tab(this._navigator,const_358,const_739,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1013));
         this.var_391.push(new Tab(this._navigator,const_298,const_254,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_474));
         this.var_391.push(new Tab(this._navigator,const_264,const_244,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_796));
         this.setSelectedTab(const_379);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_358;
      }
      
      public function get tabs() : Array
      {
         return this.var_391;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_391)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_391)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_391)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
