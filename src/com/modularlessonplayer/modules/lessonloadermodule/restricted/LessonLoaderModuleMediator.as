/*
 * Copyright (c) 2009 the original author or authors
 *
 * Permission is hereby granted to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 */

package com.modularlessonplayer.modules.lessonloadermodule.restricted
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	
	import org.robotlegs.utilities.modular.ModuleEventDispatcher;
	import org.robotlegs.utilities.modular.ModuleCommandMap;
	import org.robotlegs.mvcs.Mediator;
	
	import com.modularlessonplayer.modules.lessonloadermodule.restricted.LessonLoaderModule;
	import com.modularlessonplayer.modules.lessonloadermodule.restricted.controller.PauseLessonCommand;
	import com.modularlessonplayer.modules.lessonloadermodule.restricted.controller.PlayLessonCommand;
	import com.modularlessonplayer.modules.lessonloadermodule.restricted.view.LessonView;
	import com.modularlessonplayer.modules.lessonloadermodule.api.LessonLoaderEvent;
	import com.modularlessonplayer.modules.lessonloadermodule.api.LessonEvent;
	import com.modularlessonplayer.modules.lessonnavmodule.api.LessonNavEvent;
	import com.modularlessonplayer.modules.loggingmodule.api.LoggingEvent; 
	
	public class LessonLoaderModuleMediator extends Mediator
	{
		[Inject]
		public var view:LessonLoaderModule;
		
		[Inject]
		public var moduleDispatcher:ModuleEventDispatcher;
		
		[Inject]
		public var moduleCommandMap:ModuleCommandMap;
		
		
		override public function onRegister():void
		{
			moduleCommandMap.mapEvent(LessonNavEvent.PAUSE_LESSON, PauseLessonCommand, LessonNavEvent);
			moduleCommandMap.mapEvent(LessonNavEvent.PLAY_LESSON, PlayLessonCommand, LessonNavEvent);
			eventMap.mapListener(eventDispatcher, LessonLoaderEvent.LESSON_LOADED, onLessonLoaded );
			eventMap.mapListener(eventDispatcher, LessonEvent.LESSON_PAUSED, redispatchLessonEventToModules);
			eventMap.mapListener(eventDispatcher, LessonEvent.LESSON_PLAY, redispatchLessonEventToModules);
			
		}
		
		private function onLessonLoaded(e:LessonLoaderEvent):void{
			var lessonMC:MovieClip = e.lessonMC;
			var lessonDispatcher:EventDispatcher = e.sharedDispatcher;
			
			var lessonView:LessonView = new LessonView(lessonMC, lessonDispatcher);
			
			view.addChild(lessonView);
			logMessage("Lesson loaded correctly");
		}
		
		private function redispatchLessonEventToModules(e:LessonEvent):void{
			moduleDispatcher.dispatchEvent(e);
		}
		
		private function logMessage(msg:String):void{
			var evt:LoggingEvent = new LoggingEvent(LoggingEvent.LOG_EVENT, msg, LoggingEvent.LEVEL_DEBUG, this);
			moduleDispatcher.dispatchEvent(evt);
		}
		
	   
	}
}