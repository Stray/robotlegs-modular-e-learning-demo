/*
 * Copyright (c) 2009 the original author or authors
 *
 * Permission is hereby granted to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 */

package com.modularlessonplayer.modules.lessonloadermodule.restricted.controller 
{
	
	import org.robotlegs.mvcs.Command;
	
	import com.modularlessonplayer.modules.lessonloadermodule.restricted.services.LessonLoaderService;
	
	public class LoadLessonCommand extends Command
	{
		
		[Inject]
		public var lessonLoaderService:LessonLoaderService;
		
		public function LoadLessonCommand() 
		{
			trace("LoadLessonCommand created")
		}
		
		override public function execute():void 
		{
    	    // in the real world this lesson path would be a property of an event that triggered the loading
			lessonLoaderService.loadLesson("../assets/lessons/lesson1.swf")
   		}
		 
	}
}
