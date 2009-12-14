package com.modularlessonplayer.modules.loggingmodule.restricted.services {
	
	import org.robotlegs.mvcs.Actor;
	import com.modularlessonplayer.modules.loggingmodule.restricted.services.BaseLoggingService;
	import com.modularlessonplayer.modules.loggingmodule.api.LoggingEvent;
	
	public class TraceLoggingService extends BaseLoggingService {
		
		/* INHERITED INJECTIONS:
		[Inject(name='mvcsEventDispatcher')]
		public var eventDispatcher:IEventDispatcher;
		
		[Inject(name='mvcsEventMap')]
		public var eventMap:IEventMap;
		*/
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * No comment. 
		 * 
		 */
		public function TraceLoggingService() 
		{
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  API
		//
		//--------------------------------------------------------------------------
		
		override public function logEvent(loggingEvent:LoggingEvent):void{
			trace(loggingEvent.toString());
			super.logEvent(loggingEvent);
		}
		
	}
}
