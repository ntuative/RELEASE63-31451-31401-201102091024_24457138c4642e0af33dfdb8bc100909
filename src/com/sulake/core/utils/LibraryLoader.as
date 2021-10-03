package com.sulake.core.utils
{
   import com.sulake.core.Core;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   import flash.display.DisplayObject;
   import flash.display.FrameLabel;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.net.URLRequest;
   import flash.net.URLRequestHeader;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class LibraryLoader extends EventDispatcher implements IDisposable
   {
      
      protected static const const_1648:uint = 1;
      
      protected static const const_1651:uint = 2;
      
      protected static const const_1650:uint = 4;
      
      protected static const const_1649:uint = 3;
      
      protected static const name_3:uint = 7;
      
      public static const const_1633:int = 5;
      
      public static const LIBRARY_LOADER_FINALIZE:String = "LIBRARY_LOADER_FINALIZE";
      
      public static const const_1118:Boolean = false;
      
      public static const const_1382:int = 2;
      
      private static var var_845:Array = new Array();
      
      private static var var_683:Array = new Array();
       
      
      protected var var_39:Loader;
      
      protected var var_16:LoaderContext;
      
      protected var var_371:int = 0;
      
      protected var var_226:URLRequest;
      
      protected var var_674:XML;
      
      protected var var_543:Class;
      
      protected var var_431:uint = 0;
      
      protected var _name:String;
      
      protected var var_976:Boolean = false;
      
      protected var _debug:Boolean = false;
      
      protected var var_975:Boolean = false;
      
      protected var var_2724:String = "";
      
      protected var var_2725:String = "";
      
      protected var var_1962:int;
      
      protected var var_1215:int;
      
      protected var var_1216:int;
      
      protected var var_2809:uint = 0;
      
      protected var var_2723:Boolean = true;
      
      public function LibraryLoader(param1:LoaderContext = null, param2:Boolean = false, param3:Boolean = false)
      {
         if(param1 == null)
         {
            this.var_16 = new LoaderContext();
            this.var_16.applicationDomain = ApplicationDomain.currentDomain;
         }
         else
         {
            this.var_16 = param1;
         }
         this.var_975 = param2;
         this._debug = param3;
         this.var_371 = 0;
         this.var_39 = new Loader();
         this.var_39.contentLoaderInfo.addEventListener(Event.INIT,this.loadEventHandler);
         this.var_39.contentLoaderInfo.addEventListener(Event.COMPLETE,this.loadEventHandler);
         this.var_39.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,this.loadEventHandler);
         this.var_39.contentLoaderInfo.addEventListener(Event.UNLOAD,this.loadEventHandler);
         this.var_39.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS,this.loadEventHandler);
         this.var_39.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.loadEventHandler);
         this.var_39.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.loadEventHandler);
         super();
      }
      
      protected static function parseNameFromUrl(param1:String) : String
      {
         var _loc2_:int = 0;
         _loc2_ = param1.indexOf("?",0);
         if(_loc2_ > -1)
         {
            param1 = param1.slice(0,_loc2_);
         }
         _loc2_ = param1.lastIndexOf(".");
         if(_loc2_ > -1)
         {
            param1 = param1.slice(0,_loc2_);
         }
         _loc2_ = param1.lastIndexOf("/");
         if(_loc2_ > -1)
         {
            param1 = param1.slice(_loc2_ + 1,param1.length);
         }
         return param1;
      }
      
      protected static function queue(param1:LibraryLoader) : void
      {
         if(const_1118)
         {
            if(var_845.indexOf(param1) == -1)
            {
               var_845.push(param1);
            }
            throttle();
         }
         else
         {
            param1.var_39.load(param1.var_226,param1.var_16);
         }
      }
      
      protected static function throttle() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         if(const_1118)
         {
            _loc2_ = -1;
            while(_loc2_ > -1)
            {
               _loc1_ = var_683[_loc2_] as LibraryLoader;
               if(_loc1_ && (_loc1_.ready || _loc1_.disposed))
               {
                  var_683.splice(_loc2_,1);
               }
               _loc2_--;
            }
            while(var_683.length < const_1382 && false)
            {
               _loc1_ = var_845.shift() as LibraryLoader;
               if(!_loc1_.ready && !_loc1_.disposed)
               {
                  var_683.push(_loc1_);
                  _loc1_.var_39.load(_loc1_.var_226,_loc1_.var_16);
               }
            }
         }
      }
      
      public function get url() : String
      {
         return !!this.var_226 ? this.var_226.url : null;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get ready() : Boolean
      {
         return this.var_976;
      }
      
      public function get status() : int
      {
         return this.var_371;
      }
      
      public function get domain() : ApplicationDomain
      {
         return this.var_39.contentLoaderInfo.applicationDomain;
      }
      
      public function get request() : URLRequest
      {
         return this.var_226;
      }
      
      public function get resource() : Class
      {
         return this.var_543;
      }
      
      public function get manifest() : XML
      {
         return this.var_674;
      }
      
      public function get bytesTotal() : uint
      {
         return this.var_39.contentLoaderInfo.bytesTotal;
      }
      
      public function get bytesLoaded() : uint
      {
         return this.var_39.contentLoaderInfo.bytesLoaded;
      }
      
      public function get elapsedTime() : uint
      {
         return !!this.var_976 ? uint(this.var_1215 - this.var_1962) : uint(getTimer() - this.var_1962);
      }
      
      public function get paused() : Boolean
      {
         return this.var_975;
      }
      
      protected function get content() : DisplayObject
      {
         return this.var_39.content;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_DISPOSE,this.var_371,this.bytesTotal,this.bytesLoaded,this.elapsedTime));
            try
            {
               this.var_39.close();
            }
            catch(e:Error)
            {
            }
            try
            {
               this.var_39.unload();
            }
            catch(e:Error)
            {
            }
            this.var_39 = null;
            this.var_16 = null;
            this.var_543 = null;
            this.var_674 = null;
            super.dispose();
         }
      }
      
      public function load(param1:URLRequest, param2:int = 5) : void
      {
         this.var_976 = false;
         this.var_226 = param1;
         this.var_1216 = param2;
         ErrorReportStorage.addDebugData("Library url","Library url " + param1.url);
         this._name = parseNameFromUrl(this.var_226.url);
         ErrorReportStorage.addDebugData("Library name","Library name " + this._name);
         if(!this.var_975)
         {
            this.var_975 = true;
            this.resume();
         }
      }
      
      public function resume() : void
      {
         if(this.var_975 && !_disposed)
         {
            this.var_975 = false;
            if(!this.var_976 && this.var_226)
            {
               this.var_1215 = -1;
               this.var_1962 = getTimer();
               queue(this);
            }
         }
      }
      
      protected function retry() : Boolean
      {
         if(!this.var_976 && !_disposed && this.var_1216 > 0)
         {
            try
            {
               this.var_39.close();
               this.var_39.unload();
            }
            catch(e:Error)
            {
            }
            this.addRequestCounterToUrlRequest(this.var_226,const_1633 - this.var_1216);
            if(this.var_2723)
            {
               this.var_226.requestHeaders.push(new URLRequestHeader("pragma","no-cache"));
               this.var_226.requestHeaders.push(new URLRequestHeader("Cache-Control","no-cache"));
               this.var_2723 = false;
            }
            --this.var_1216;
            this.var_431 = 0;
            this.var_39.load(this.var_226,this.var_16);
            return true;
         }
         return false;
      }
      
      public function hasDefinition(param1:String) : Boolean
      {
         var name:String = param1;
         try
         {
            return this.var_39.contentLoaderInfo.applicationDomain.hasDefinition(name);
         }
         catch(e:Error)
         {
            return false;
         }
      }
      
      public function getDefinition(param1:String) : Object
      {
         var name:String = param1;
         try
         {
            if(this.var_39.contentLoaderInfo.applicationDomain.hasDefinition(name))
            {
               return this.var_39.contentLoaderInfo.applicationDomain.getDefinition(name);
            }
         }
         catch(e:Error)
         {
         }
         return null;
      }
      
      protected function loadEventHandler(param1:Event) : void
      {
         var _loc2_:* = null;
         switch(param1.type)
         {
            case Event.INIT:
               this.debug("Load event INIT for file \"" + this.url + "\"");
               this.var_431 |= 0;
               break;
            case Event.COMPLETE:
               this.debug("Load event COMPLETE for file \"" + this.url + "\"");
               this.var_431 |= 0;
               break;
            case Event.ENTER_FRAME:
               break;
            case HTTPStatusEvent.HTTP_STATUS:
               this.var_371 = HTTPStatusEvent(param1).status;
               this.debug("Load event STATUS " + this.var_371 + " for file \"" + this.url + "\"");
               break;
            case Event.UNLOAD:
               this.debug("Load event UNLOAD for file \"" + this.url + "\"");
               dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_UNLOAD,this.var_371,this.bytesTotal,this.bytesLoaded,this.elapsedTime));
               break;
            case ProgressEvent.PROGRESS:
               this.debug("Load event PROGRESS for file \"" + this.url + "\"  bytes: " + this.bytesLoaded + "/" + this.bytesTotal);
               dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,this.var_371,this.bytesTotal,this.bytesLoaded,this.elapsedTime));
               break;
            case IOErrorEvent.IO_ERROR:
               this.debug("Load event IO ERROR for file \"" + this.url + "\"");
               if(!this.handleHttpStatus(this.var_371))
               {
                  this.var_1215 = getTimer();
                  this.failure("IO Error, send or load operation failed for file \"" + this.url + "\"");
                  this.removeEventListeners();
               }
               break;
            case SecurityErrorEvent.SECURITY_ERROR:
               this.var_1215 = getTimer();
               this.failure("Security Error, security violation with file \"" + this.url + "\"");
               this.removeEventListeners();
               break;
            case TimerEvent.TIMER:
               _loc2_ = TimerEvent(param1).target as Timer;
               _loc2_.removeEventListener(TimerEvent.TIMER,this.loadEventHandler);
               _loc2_.stop();
               if(!_disposed)
               {
                  this.var_431 = LibraryLoader.name_3;
                  this.loadEventHandler(new Event(Event.COMPLETE));
               }
               return;
            default:
               Logger.log("LibraryLoader::loadEventHandler(" + param1 + ")");
         }
         if(this.var_431 == LibraryLoader.const_1649)
         {
            if(this.analyzeLibrary())
            {
               this.var_431 |= 0;
            }
         }
         if(this.var_431 == LibraryLoader.name_3)
         {
            if(this.prepareLibrary())
            {
               this.var_976 = true;
               this.var_1215 = getTimer();
               this.removeEventListeners();
               throttle();
               dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,this.var_371,this.bytesTotal,this.bytesLoaded,this.elapsedTime));
               dispatchEvent(new Event(LIBRARY_LOADER_FINALIZE));
            }
         }
      }
      
      protected function analyzeLibrary() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         this.debug("Analyzing library \"" + this._name + "\", content " + (this.content is MovieClip ? "is" : "is not") + " a MovieClip");
         this.debug("\tBytes loaded: " + this.var_39.contentLoaderInfo.bytesLoaded + "/" + this.var_39.contentLoaderInfo.bytesTotal);
         if(this.content is MovieClip)
         {
            _loc1_ = this.content as MovieClip;
            _loc3_ = _loc1_.currentLabels;
            this.debug("\tLibrary \"" + this._name + "\" is in frame " + _loc1_.currentFrame + "(" + _loc1_.currentLabel + ")");
            if(_loc3_.length > 1)
            {
               _loc4_ = 0;
               while(_loc4_ < _loc3_.length)
               {
                  _loc2_ = _loc3_[_loc4_] as FrameLabel;
                  if(_loc2_.name == this._name)
                  {
                     if(_loc2_.frame != _loc1_.currentFrame)
                     {
                        _loc1_.addEventListener(Event.ENTER_FRAME,this.loadEventHandler);
                        return false;
                     }
                  }
                  _loc4_++;
               }
            }
         }
         return true;
      }
      
      protected function prepareLibrary() : Boolean
      {
         var xmlClass:Class = null;
         this.debug("Preparing library \"" + this._name + "\"");
         this.var_543 = this.getDefinition(this._name) as Class;
         if(this.var_543 == null)
         {
            if(!this.retry())
            {
               this.failure("Failed to find resource class \"" + this._name + "\" from library " + this.var_226.url + "!");
            }
            return false;
         }
         try
         {
            xmlClass = this.var_543.manifest as Class;
            if(xmlClass == null)
            {
               return false;
            }
         }
         catch(e:Error)
         {
            if(!retry())
            {
               failure("Failed to find embedded manifest.xml from library undefined!");
            }
            return false;
         }
         var bytes:ByteArray = new xmlClass() as ByteArray;
         try
         {
            this.var_674 = new XML(bytes.readUTFBytes(bytes.length));
         }
         catch(e:Error)
         {
            if(!retry())
            {
               failure("Failed to extract manifest.xml from library " + _name + "!\n" + e.message);
            }
            return false;
         }
         return true;
      }
      
      protected function handleHttpStatus(param1:int) : Boolean
      {
         if(param1 == 0 || param1 >= 400)
         {
            if(this.retry())
            {
               return true;
            }
            this.failure("HTTP Error " + param1 + " \"" + this.var_39.contentLoaderInfo.url + "\"");
            this.removeEventListeners();
         }
         return false;
      }
      
      protected function addRequestCounterToUrlRequest(param1:URLRequest, param2:int) : void
      {
         var _loc9_:int = 0;
         var _loc10_:* = null;
         if(param1.url == null || param1.url == "")
         {
            return;
         }
         var _loc3_:Array = param1.url.split("?");
         var _loc4_:String = _loc3_[0];
         var _loc5_:String = _loc3_.length > 1 ? _loc3_[1] : "";
         var _loc7_:Array = _loc5_.split("&");
         var _loc8_:Boolean = false;
         _loc9_ = 0;
         while(_loc9_ < _loc7_.length)
         {
            _loc10_ = _loc7_[_loc9_];
            if(_loc10_.indexOf("counterparameter=") >= 0)
            {
               _loc10_ = "counterparameter=" + param2.toString();
               _loc7_[_loc9_] = _loc10_;
               _loc8_ = true;
               break;
            }
            _loc9_++;
         }
         if(!_loc8_)
         {
            _loc7_.push("counterparameter=" + param2);
         }
         _loc9_ = 0;
         while(_loc9_ < _loc7_.length)
         {
            _loc4_ += (_loc9_ == 0 ? "?" : "&") + _loc7_[_loc9_];
            _loc9_++;
         }
         param1.url = _loc4_;
      }
      
      protected function removeEventListeners() : void
      {
         if(this.var_39)
         {
            if(this.var_39.content != null)
            {
               this.var_39.content.removeEventListener(Event.ENTER_FRAME,this.loadEventHandler);
            }
            this.var_39.contentLoaderInfo.removeEventListener(Event.INIT,this.loadEventHandler);
            this.var_39.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.loadEventHandler);
            this.var_39.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,this.loadEventHandler);
            this.var_39.contentLoaderInfo.removeEventListener(Event.UNLOAD,this.loadEventHandler);
            this.var_39.contentLoaderInfo.removeEventListener(HTTPStatusEvent.HTTP_STATUS,this.loadEventHandler);
            this.var_39.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this.loadEventHandler);
            this.var_39.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.loadEventHandler);
         }
      }
      
      protected function debug(param1:String) : void
      {
         Core.debug(param1);
         this.var_2725 = param1;
         if(this._debug)
         {
            dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_DEBUG,this.var_371,this.bytesTotal,this.bytesLoaded,this.elapsedTime));
         }
      }
      
      protected function failure(param1:String) : void
      {
         Core.warning(param1);
         this.var_2724 = param1;
         throttle();
         dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,this.var_371,this.bytesTotal,this.bytesLoaded,this.elapsedTime));
         dispatchEvent(new Event(LIBRARY_LOADER_FINALIZE));
      }
      
      public function getLastDebugMessage() : String
      {
         return this.var_2725;
      }
      
      public function getLastErrorMessage() : String
      {
         return this.var_2724;
      }
   }
}
