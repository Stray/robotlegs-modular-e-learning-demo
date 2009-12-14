/*
 * Copyright (c) 2009 the original author or authors
 *
 * Permission is hereby granted to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 */
 
package com.modularlessonplayer.modules.loggingmodule.restricted.services {
	
	import com.modularlessonplayer.modules.loggingmodule.api.LoggingEvent;
	
	/**
	 *	Description
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author Lindsey Fallow
	 *	@since  06.12.2009
	 */
	public interface ILoggingService {
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
		
		function logEvent(loggingEvent:LoggingEvent):void;
		
		function dumpLogEvents():Vector.<LoggingEvent>;
		
		function dumpLogString():String;
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
	}
	
}
