/*
 * Copyright (c) 2009 the original author or authors
 *
 * Permission is hereby granted to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 */
 
package com.modularlessonplayer.modules.skinmanagermodule.api {
	import flash.events.Event;                                             
	
	import com.modularlessonplayer.modules.common.ISkinProvider;
	
	/**
	 *	Event subclass description.
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author Lindsey Fallow
	 *	@since  05.12.2009
	 */
	public class SkinChangeEvent extends Event {
		
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		
		public static const SKIN_CHANGED : String = "skinChanged";
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
		
		/**
		 *	@constructor
		 */
		public function SkinChangeEvent( type:String, skinProvider:ISkinProvider, bubbles:Boolean=true, cancelable:Boolean=false ){
			_skinProvider = skinProvider;
			super(type, bubbles, cancelable);		
		}
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		public function get skinProvider():ISkinProvider{
			return _skinProvider;
		}
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------

		override public function clone() : Event {
			return new SkinChangeEvent(type, _skinProvider, bubbles, cancelable);
		}
		
		//--------------------------------------
		//  EVENT HANDLERS
		//--------------------------------------

		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		private var _skinProvider:ISkinProvider;
		
		//--------------------------------------
		//  PRIVATE & PROTECTED INSTANCE METHODS
		//--------------------------------------
		
	}
	
}
