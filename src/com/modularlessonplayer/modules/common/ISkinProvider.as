/*
 * Copyright (c) 2009 the original author or authors
 *
 * Permission is hereby granted to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 */ 

package com.modularlessonplayer.modules.common
{
	
	
	import flash.display.Sprite;
	
	/**
	 *	Interface for a skin managing class which can return a skin based on the class asking for it.
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author Lindsey Fallow
	 *	@since  05.12.2009
	 */
	public interface ISkinProvider 
	{
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
		
		// To support loose coupling it's a good idea to process the moduleToSkin Sprite based on class name (Fully qualified)
		// rather than make the concrete SkinProvider aware of actual classes.
		
		function getSkin(moduleToSkin:Sprite):Sprite;
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
	}
	
}
