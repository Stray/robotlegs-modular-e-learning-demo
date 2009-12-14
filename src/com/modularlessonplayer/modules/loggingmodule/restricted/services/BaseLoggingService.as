package com.modularlessonplayer.modules.loggingmodule.restricted.services {
	
	import org.robotlegs.mvcs.Actor;
	import com.modularlessonplayer.modules.loggingmodule.api.LoggingEvent;
	import com.modularlessonplayer.modules.loggingmodule.restricted.services.ILoggingService;
	
	public class BaseLoggingService extends Actor implements ILoggingService {
		
		/* INHERITED INJECTIONS:
		[Inject(name='mvcsEventDispatcher')]
		public var eventDispatcher:IEventDispatcher;
		
		[Inject(name='mvcsEventMap')]
		public var eventMap:IEventMap;
		*/
		
		protected var logEventsVector:Vector.<LoggingEvent>;
		
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * No comment. 
		 * 
		 */
		public function BaseLoggingService()  
		{
			super();
			logEventsVector = new Vector.<LoggingEvent>();
		}
		
		//--------------------------------------------------------------------------
		//
		//  API
		//
		//--------------------------------------------------------------------------
		
		public function logEvent(loggingEvent:LoggingEvent):void{
			logEventsVector[logEventsVector.length] = loggingEvent;
		}
		
		public function dumpLogEvents():Vector.<LoggingEvent>{
			return logEventsVector;
		}
		
		public function dumpLogString():String{
		    var logString:String = logEventsVector.join("\r");
			return logString;
		}
	}
}
