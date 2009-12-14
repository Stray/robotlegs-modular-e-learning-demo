package com.modularlessonplayer.modules.lessonnavmodule.restricted {
	
	import org.robotlegs.utilities.modular.GenericModule;
	
	public class LessonNavModule extends GenericModule 
	{	
				
		public function LessonNavModule():void
		{
			trace("LessonNavModule instantiated");
			context = new LessonNavModuleContext(this);
		}
	
	}
}
