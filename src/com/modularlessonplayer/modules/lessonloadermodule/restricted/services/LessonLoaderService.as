package com.modularlessonplayer.modules.lessonloadermodule.restricted.services {
	
	import org.robotlegs.mvcs.Actor;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.system.LoaderContext;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	
	import com.modularlessonplayer.modules.lessonloadermodule.api.LessonLoaderEvent;
	
	
	public class LessonLoaderService extends Actor{
		
		/* INHERITED INJECTIONS:
		[Inject(name='mvcsEventDispatcher')]
		public var eventDispatcher:IEventDispatcher;
		
		[Inject(name='mvcsEventMap')]
		public var eventMap:IEventMap;
		*/
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * No comment. 
		 * 
		 */
		public function LessonLoaderService() 
		{
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  API
		//
		//--------------------------------------------------------------------------
		
		public function loadLesson(lessonPath:String):void{
			var swfLoader:Loader = new Loader();
			var urlRequest:URLRequest = new URLRequest(lessonPath);
			swfLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onSwfLoadComplete);
			var loaderContext:LoaderContext = new LoaderContext();
			loaderContext.applicationDomain = ApplicationDomain.currentDomain;
			swfLoader.load(urlRequest, loaderContext);
		}
		
		//--------------------------------------------------------------------------
		//
		//  API
		//
		//--------------------------------------------------------------------------
		
		private function onSwfLoadComplete(e:Event):void{
			trace("onSwfLoadComplete");
			var loaderInfoObj:LoaderInfo = e.target as LoaderInfo;
			var contentMC:MovieClip = loaderInfoObj.content as MovieClip;
			var sharedDispatcher:EventDispatcher = loaderInfoObj.sharedEvents;
			//
			var evt:LessonLoaderEvent = new LessonLoaderEvent(LessonLoaderEvent.LESSON_LOADED, contentMC, sharedDispatcher);
			eventDispatcher.dispatchEvent(evt);
		}
		
	}
}
