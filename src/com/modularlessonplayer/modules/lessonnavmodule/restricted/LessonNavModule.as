package com.modularlessonplayer.modules.lessonnavmodule.restricted {
	
	import org.robotlegs.utilities.modular.mvcs.ModuleContextView;
	
	public class LessonNavModule extends ModuleContextView 
	{	
				
		public function LessonNavModule()
		{
			trace("LessonNavModule instantiated");
			context = new LessonNavModuleContext(this);
		}
	
	}
}
