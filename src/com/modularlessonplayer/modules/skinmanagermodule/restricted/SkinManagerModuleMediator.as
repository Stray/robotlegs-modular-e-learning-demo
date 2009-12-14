/*
 * Copyright (c) 2009 the original author or authors
 *
 * Permission is hereby granted to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 */

package com.modularlessonplayer.modules.skinmanagermodule.restricted
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import org.robotlegs.utilities.modular.ModuleEventDispatcher;
	import org.robotlegs.mvcs.Mediator;
	
	import com.modularlessonplayer.modules.skinmanagermodule.restricted.SkinManagerModule;
	import com.modularlessonplayer.modules.skinmanagermodule.restricted.events.SkinLoadedEvent;
	import com.modularlessonplayer.modules.skinmanagermodule.api.SkinChangeEvent;
	import com.modularlessonplayer.modules.loggingmodule.api.LoggingEvent;
	
	public class SkinManagerModuleMediator extends Mediator
	{
		[Inject]
		public var view:SkinManagerModule;
		
		[Inject]
		public var moduleDispatcher:ModuleEventDispatcher;
		
		override public function onRegister():void
		{
			eventMap.mapListener(eventDispatcher, SkinLoadedEvent.SKIN_LOADED, skinLoadedHandler);
		}
		
		private function skinLoadedHandler(e:SkinLoadedEvent):void{
			trace("skinLoadedHandler");
			logMessage("Loaded new skin: " + e.skinSourceName);
			view.appendAssetsList(e.assetsList);
			var skinChangeEvent:SkinChangeEvent = new SkinChangeEvent(SkinChangeEvent.SKIN_CHANGED, view);
			moduleDispatcher.dispatchEvent(skinChangeEvent);
		}
		
		private function logMessage(msg:String):void{
			var evt:LoggingEvent = new LoggingEvent(LoggingEvent.LOG_EVENT, msg, LoggingEvent.LEVEL_DEBUG, this);
			moduleDispatcher.dispatchEvent(evt);
		}
		
		
	}
}