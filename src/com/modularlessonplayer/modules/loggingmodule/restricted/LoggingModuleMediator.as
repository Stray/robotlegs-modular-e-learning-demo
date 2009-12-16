/*
 * Copyright (c) 2009 the original author or authors
 *
 * Permission is hereby granted to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 */

package com.modularlessonplayer.modules.loggingmodule.restricted
{
	
	import org.robotlegs.utilities.modular.mvcs.ModuleMediator;
	
	import com.modularlessonplayer.modules.loggingmodule.restricted.LoggingModule;
	import com.modularlessonplayer.modules.loggingmodule.restricted.controller.UpdateLogCommand;
	import com.modularlessonplayer.modules.loggingmodule.api.LoggingEvent;
	
	public class LoggingModuleMediator extends ModuleMediator
	{
		[Inject]
		public var view:LoggingModule;
		
	    
		override public function onRegister():void
		{
			moduleCommandMap.mapEvent(LoggingEvent.LOG_EVENT, UpdateLogCommand, LoggingEvent);
			
		}
		
		
	   
	}
}