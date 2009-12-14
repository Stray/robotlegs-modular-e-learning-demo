package com.modularlessonplayer.modules.loggingmodule.restricted.services {
	
	import org.robotlegs.mvcs.Actor;
	import com.modularlessonplayer.modules.loggingmodule.restricted.services.BaseLoggingService;
	import com.modularlessonplayer.modules.loggingmodule.api.LoggingEvent;
	import flash.text.TextField;
	
	public class TextFieldLoggingService extends BaseLoggingService {
		
		/* INHERITED INJECTIONS:
		[Inject(name='mvcsEventDispatcher')]
		public var eventDispatcher:IEventDispatcher;
		
		[Inject(name='mvcsEventMap')]
		public var eventMap:IEventMap;
		*/
		
		[Inject(name='logTextField')]
		public var logTextField:TextField;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * No comment. 
		 * 
		 */
		public function TextFieldLoggingService() 
		{
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  API
		//
		//--------------------------------------------------------------------------
		
		override public function logEvent(loggingEvent:LoggingEvent):void{
			logTextField.appendText(loggingEvent.toString() + "\r ");
			super.logEvent(loggingEvent);
		}
	}
}
