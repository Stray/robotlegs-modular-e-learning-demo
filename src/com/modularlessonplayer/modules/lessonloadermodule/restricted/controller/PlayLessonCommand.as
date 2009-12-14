/*
 * Copyright (c) 2009 the original author or authors
 *
 * Permission is hereby granted to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 */

package com.modularlessonplayer.modules.lessonloadermodule.restricted.controller {
	
	import org.robotlegs.mvcs.Command;
	
	import com.modularlessonplayer.modules.lessonloadermodule.restricted.view.LessonViewMediator;
	
	public class PlayLessonCommand extends Command
	{
		
		[Inject]
		public var lesson:LessonViewMediator;
		
		public function PlayLessonCommand() 
		{
		}
		
		override public function execute():void 
		{
			// do stuff here
			lesson.play();
		} 
	}
}
