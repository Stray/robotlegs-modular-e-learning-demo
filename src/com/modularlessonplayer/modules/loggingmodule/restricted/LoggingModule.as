package com.modularlessonplayer.modules.loggingmodule.restricted {
	
	import org.robotlegs.utilities.modular.mvcs.ModuleContextView;
	import com.modularlessonplayer.modules.loggingmodule.restricted.LoggingModuleContext;	
	
	public class LoggingModule extends ModuleContextView 
	{
				
		public function LoggingModule()
		{
			trace("LoggingModule instantiated");
			context = new LoggingModuleContext(this);
			
		}
	
	}
}
