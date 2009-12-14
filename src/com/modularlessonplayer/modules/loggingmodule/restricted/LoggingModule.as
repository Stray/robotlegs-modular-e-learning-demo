package com.modularlessonplayer.modules.loggingmodule.restricted {
	
	import org.robotlegs.utilities.modular.GenericModule;
	import com.modularlessonplayer.modules.loggingmodule.restricted.LoggingModuleContext;	
	
	public class LoggingModule extends GenericModule 
	{
				
		public function LoggingModule():void
		{
			trace("LoggingModule instantiated");
			context = new LoggingModuleContext(this);
			
		}
	
	}
}
