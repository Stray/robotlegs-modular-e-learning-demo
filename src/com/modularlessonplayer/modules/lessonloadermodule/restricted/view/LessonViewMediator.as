package com.modularlessonplayer.modules.lessonloadermodule.restricted.view {
	
	import org.robotlegs.mvcs.Mediator;
   	import com.modularlessonplayer.modules.lessonloadermodule.restricted.view.LessonView;
	import com.modularlessonplayer.modules.lessonloadermodule.api.LessonEvent;
	
	import flash.events.MouseEvent;
	
	public class LessonViewMediator extends Mediator {
		
		// declare the view to be injected
		[Inject]
		public var view:LessonView;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Avoid doing work in the constructor!
		 * onRegister() is the place to do things. 
		 * 
		 */
		
		public function LessonViewMediator() {			
			trace("LessonViewMediator");
			// Try not to put stuff in the constructor of the mediator
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overridden API
		//
		//--------------------------------------------------------------------------
		/**
		 * Initialize the view and register for events. 
		 * 
		 */
		override public function onRegister():void
		{			
			view.lessonDispatcher.addEventListener(LessonEvent.LESSON_PAUSED, lessonPausedHandler);
			view.addEventListener(MouseEvent.CLICK, lessonClickedHandler);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event Handlers
		//
		//--------------------------------------------------------------------------
		
		// this comes through from the loaded swf as a vanilla object because Adobe hate us
		private function lessonPausedHandler(o:Object):void{
			var e:LessonEvent = new LessonEvent(LessonEvent.LESSON_PAUSED);
			dispatch(e);
		}
		
		private function lessonClickedHandler(e:MouseEvent):void{
			play();
			view.removeEventListener(MouseEvent.CLICK, lessonClickedHandler);
			var evt:LessonEvent = new LessonEvent(LessonEvent.LESSON_PLAY);
			dispatch(evt);
		}
		
		//--------------------------------------------------------------------------
		//
		//  API
		//
		//--------------------------------------------------------------------------
		
		public function pause():void{
			view.lesson.stop();
		}
		
		public function play():void{
			view.lesson.play();
		}
		
		
	}
}
