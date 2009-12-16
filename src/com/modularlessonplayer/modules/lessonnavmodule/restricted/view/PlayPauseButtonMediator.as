package com.modularlessonplayer.modules.lessonnavmodule.restricted.view {
	
	import com.modularlessonplayer.modules.lessonnavmodule.restricted.view.PlayPauseButton;
	
	import org.robotlegs.mvcs.Mediator;
	
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	
	import com.modularlessonplayer.modules.lessonnavmodule.api.LessonNavEvent;
	import com.modularlessonplayer.modules.lessonloadermodule.api.LessonEvent;
	import com.modularlessonplayer.modules.loggingmodule.api.LoggingEvent;
	
	import com.modularlessonplayer.modules.skinmanagermodule.api.SkinChangeEvent;
	import com.modularlessonplayer.modules.common.ISkinProvider;
	
	public class PlayPauseButtonMediator extends Mediator {
		
		// declare the view to be injected
		[Inject]
		public var view:PlayPauseButton;
		
		private var _isPlaying:Boolean = false;
		
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
		
		public function PlayPauseButtonMediator() {			
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
			eventMap.mapListener(view, MouseEvent.CLICK, playPauseClickHandler);
			eventMap.mapListener(eventDispatcher, LessonEvent.LESSON_PAUSED, lessonPausedHandler);
			eventMap.mapListener(eventDispatcher, LessonEvent.LESSON_PLAY, lessonPlayHandler);
			eventMap.mapListener(eventDispatcher, SkinChangeEvent.SKIN_CHANGED, skinChangeHandler);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event Handlers
		//
		//--------------------------------------------------------------------------
		
		private function playPauseClickHandler(e:MouseEvent):void{
			_isPlaying = !_isPlaying;
			view.setIsPlaying(_isPlaying);
			var eventString:String = LessonNavEvent.PAUSE_LESSON;
			if(_isPlaying){
				eventString = LessonNavEvent.PLAY_LESSON;
			}
			var evt:LessonNavEvent = new LessonNavEvent(eventString);
			dispatch(evt);
			logMessage("Lesson navigation used");
		}
		
		private function lessonPausedHandler(e:LessonEvent):void{
			_isPlaying = false;
			view.setIsPlaying(_isPlaying);
			logMessage("Lesson paused");
		}
		
		private function lessonPlayHandler(e:LessonEvent):void{
			_isPlaying = true;
			view.setIsPlaying(_isPlaying);
			logMessage("Lesson playing");
		}
		
		private function skinChangeHandler(e:SkinChangeEvent):void{
			var skinProvider:ISkinProvider = e.skinProvider;
			var skin:Sprite = skinProvider.getSkin(view);
			view.setSkin(skin);
		}
		
		private function logMessage(msg:String):void{
			var evt:LoggingEvent = new LoggingEvent(LoggingEvent.LOG_EVENT, msg, LoggingEvent.LEVEL_DEBUG, this);
			dispatch(evt);
		}
		
	}
}
