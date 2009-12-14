/*
 * Copyright (c) 2009 the original author or authors
 *
 * Permission is hereby granted to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 */

package com.modularlessonplayer.modules.loggingmodule.restricted
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	
	import org.robotlegs.utilities.modular.ModuleEventDispatcher;
	import org.robotlegs.utilities.modular.ModuleCommandMap;
	import org.robotlegs.mvcs.Mediator;
	
	import com.modularlessonplayer.modules.loggingmodule.restricted.LoggingModule;
	import com.modularlessonplayer.modules.loggingmodule.restricted.controller.UpdateLogCommand;
	import com.modularlessonplayer.modules.loggingmodule.api.LoggingEvent;
	
	public class LoggingModuleMediator extends Mediator
	{
		[Inject]
		public var view:LoggingModule;
		
		[Inject]
		public var moduleDispatcher:ModuleEventDispatcher;
		
		[Inject]
		public var moduleCommandMap:ModuleCommandMap;
		
		
		override public function onRegister():void
		{
			moduleCommandMap.mapEvent(LoggingEvent.LOG_EVENT, UpdateLogCommand, LoggingEvent);
			
		}
		
		
		private function redispatchEventToModules(e:Event):void{
			moduleDispatcher.dispatchEvent(e);
		}
		
	   
	}
}