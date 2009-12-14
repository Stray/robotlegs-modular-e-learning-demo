/*
 * Copyright (c) 2009 the original author or authors
 *
 * Permission is hereby granted to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 */

package com.modularlessonplayer.modules.lessonloadermodule.restricted 
{
	
	import org.robotlegs.utilities.modular.GenericModule;
	import com.modularlessonplayer.modules.lessonloadermodule.restricted.LessonLoaderModuleContext;	
	
	public class LessonLoaderModule extends GenericModule 
	{
				
		public function LessonLoaderModule():void
		{
			trace("LessonLoaderModule instantiated");
			context = new LessonLoaderModuleContext(this);
			
		}
	
	}
}
