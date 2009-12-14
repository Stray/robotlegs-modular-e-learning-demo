package com.modularlessonplayer.modules.lessonloadermodule.restricted.view {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import com.modularlessonplayer.modules.lessonloadermodule.api.LessonEvent;
	
	public class LessonView extends MovieClip {
		 
		
		private var _lessonMC:MovieClip;
		private var _lessonDispatcher:EventDispatcher;
		
	    //--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Event handling takes place via the mediator: LessonViewMediator 
		 * 
		 */
		
		public function LessonView(lessonMC:MovieClip, lessonDispatcher:EventDispatcher) {			
		
			_lessonMC = lessonMC;
			_lessonDispatcher = lessonDispatcher;
			addChild(_lessonMC);
		}
		
		public function get lesson():MovieClip{
			return _lessonMC;
		}
		
		public function get lessonDispatcher():EventDispatcher{
			return _lessonDispatcher;
		}
		
				
	}
}
