/*
 * Copyright (c) 2009 the original author or authors
 *
 * Permission is hereby granted to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 */
 
package com.modularlessonplayer.modules.skinmanagermodule.restricted.events {
	import flash.events.Event;
	
	/**
	 *	Event subclass description.
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author Lindsey Fallow
	 *	@since  05.12.2009
	 */
	public class SkinLoadedEvent extends Event {
		
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		
		public static const SKIN_LOADED : String = "skinLoaded";
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
		
		/**
		 *	@constructor
		 */
		public function SkinLoadedEvent( type:String, assetsList:Array, skinSourceName:String, bubbles:Boolean=true, cancelable:Boolean=false ){
			_assetsList = assetsList;
			_skinSourceName = skinSourceName;
			super(type, bubbles, cancelable);		
		}
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		public function get assetsList():Array{
			return _assetsList;
		}
		
		public function get skinSourceName():String{
			return _skinSourceName;
		}
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------

		override public function clone() : Event {
			return new SkinLoadedEvent(type, _assetsList, _skinSourceName, bubbles, cancelable);
		}
		
		//--------------------------------------
		//  EVENT HANDLERS
		//--------------------------------------

		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		private var _assetsList:Array;
		
		private var _skinSourceName:String;
		
		//--------------------------------------
		//  PRIVATE & PROTECTED INSTANCE METHODS
		//--------------------------------------
		
	}
	
}
