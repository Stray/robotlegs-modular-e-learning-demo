/*
 * Copyright (c) 2009 the original author or authors
 *
 * Permission is hereby granted to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 */

package com.modularlessonplayer.modules.lessonloadermodule.restricted 
{
	
	import org.robotlegs.utilities.modular.mvcs.ModuleContextView;
	import com.modularlessonplayer.modules.lessonloadermodule.restricted.LessonLoaderModuleContext;	
	
	public class LessonLoaderModule extends ModuleContextView 
	{
				
		public function LessonLoaderModule()
		{
			trace("LessonLoaderModule instantiated");
			context = new LessonLoaderModuleContext(this);
			
		}
	
	}
}
