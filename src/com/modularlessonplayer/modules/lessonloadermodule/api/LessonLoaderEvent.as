/*
 * Copyright (c) 2009 the original author or authors
 *
 * Permission is hereby granted to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 */
 
package com.modularlessonplayer.modules.lessonloadermodule.api 
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.display.MovieClip;
	
	/**
	 *	Event subclass description.
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author Lindsey Fallow
	 *	@since  30.11.2009
	 */
	public class LessonLoaderEvent extends Event 
	{
		
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		
		public static const LESSON_LOADED : String = "lessonLoaded";
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
		
		/**
		 *	@constructor
		 */
		public function LessonLoaderEvent( type:String, lessonMC:MovieClip, sharedDispatcher:EventDispatcher, bubbles:Boolean=true, cancelable:Boolean=false )
		{
			_lessonMC = lessonMC;
			_sharedDispatcher = sharedDispatcher;
			super(type, bubbles, cancelable);		
		}
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		public function get lessonMC():MovieClip
		{
			return _lessonMC;
		}
		
		public function get sharedDispatcher():EventDispatcher
		{
			return _sharedDispatcher;
		}
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------

		override public function clone() : Event
		{
			return new LessonLoaderEvent(type, _lessonMC, _sharedDispatcher, bubbles, cancelable);
		}
		
		//--------------------------------------
		//  EVENT HANDLERS
		//--------------------------------------

		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		private var _lessonMC:MovieClip;
		
		private var _sharedDispatcher:EventDispatcher;
		
		//--------------------------------------
		//  PRIVATE & PROTECTED INSTANCE METHODS
		//--------------------------------------
		
	}
	
}
