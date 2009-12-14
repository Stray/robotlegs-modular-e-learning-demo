package com.modularlessonplayer.modules.loggingmodule.restricted.controller {
	
	import org.robotlegs.mvcs.Command;
	
	import com.modularlessonplayer.modules.loggingmodule.restricted.services.ILoggingService;
	import com.modularlessonplayer.modules.loggingmodule.api.LoggingEvent;
	
	public class UpdateLogCommand extends Command{
		
		[Inject]
		public var loggingService:ILoggingService;
		
		[Inject]
		public var loggingEvent:LoggingEvent;
		
		public function UpdateLogCommand() {
		}
		
		override public function execute():void {
			// do stuff here
			loggingService.logEvent(loggingEvent);
		} 
	}
}
