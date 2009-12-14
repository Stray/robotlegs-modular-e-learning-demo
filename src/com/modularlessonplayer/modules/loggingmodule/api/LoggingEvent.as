/*
 * Copyright (c) 2009 the original author or authors
 *
 * Permission is hereby granted to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 */
 
package com.modularlessonplayer.modules.loggingmodule.api {
	import flash.events.Event;
	
	/**
	 *	Event subclass description.
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author Lindsey Fallow
	 *	@since  06.12.2009
	 */
	public class LoggingEvent extends Event {
		
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		
		public static const LOG_EVENT : String = "logEvent";
		
		public static const LEVEL_DEBUG : String = "Debug";
		public static const LEVEL_WARNING : String = "Warning";
		public static const LEVEL_ERROR : String = "Error";
		public static const LEVEL_INFO : String = "Info";
		public static const LEVEL_FATAL : String = "Fatal"
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
		
		/**
		 *	@constructor
		 */
		public function LoggingEvent( type:String, message:String, level:String, sender:*, bubbles:Boolean=true, cancelable:Boolean=false ){
			
			_message = message;
			_level = level;
			_sender = Object(sender).toString();
			_dateTimeString = new Date().toString();
			
			super(type, bubbles, cancelable);		
		}
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		public function get level():String{
			return _level;
		}
		
		public function get message():String{
			return _message;
		}
		
		public function get sender():String{
			return _sender;
		}
		
		public function get dateTimeString():String{
			return _dateTimeString;
		}
		
		override public function toString():String{
			var str:String = _dateTimeString + "::" + _level + " -> [" + _message + "] by " + _sender;
			return str;
		}
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------

		override public function clone() : Event {
			return new LoggingEvent(type, _message, _level, _sender, bubbles, cancelable);
		}
		
		//--------------------------------------
		//  EVENT HANDLERS
		//--------------------------------------
        
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		private var _level:String;
		private var _message:String;
		private var _sender:String;
		private var _dateTimeString:String;
		
		//--------------------------------------
		//  PRIVATE & PROTECTED INSTANCE METHODS
		//--------------------------------------
		
	}
	
}
