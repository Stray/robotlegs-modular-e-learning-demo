/*
 * Copyright (c) 2009 the original author or authors
 *
 * Permission is hereby granted to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 */

package com.modularlessonplayer.modules.lessonnavmodule.restricted
{
	
	import org.robotlegs.utilities.modular.mvcs.ModuleMediator;
	
	
	import com.modularlessonplayer.modules.lessonnavmodule.restricted.LessonNavModule;
	import com.modularlessonplayer.modules.lessonnavmodule.api.LessonNavEvent;
	import com.modularlessonplayer.modules.lessonloadermodule.api.LessonEvent;
	import com.modularlessonplayer.modules.skinmanagermodule.api.SkinChangeEvent;
	
	import com.modularlessonplayer.modules.loggingmodule.api.LoggingEvent;	
	
	public class LessonNavModuleMediator extends ModuleMediator
	{
		[Inject]
		public var view:LessonNavModule;
		
		override public function onRegister():void
		{
			eventMap.mapListener(eventDispatcher, LessonNavEvent.PAUSE_LESSON, redispatchToModules );
			eventMap.mapListener(eventDispatcher, LessonNavEvent.PLAY_LESSON, redispatchToModules );
			eventMap.mapListener(moduleDispatcher, LessonEvent.LESSON_PAUSED, redispatchInternally);
			eventMap.mapListener(moduleDispatcher, LessonEvent.LESSON_PLAY, redispatchInternally);
			eventMap.mapListener(moduleDispatcher, SkinChangeEvent.SKIN_CHANGED, redispatchInternally);
			eventMap.mapListener(eventDispatcher, LoggingEvent.LOG_EVENT, redispatchToModules);
		}
		
	    
		
	}
}