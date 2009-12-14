/*
 * Copyright (c) 2009 the original author or authors
 *
 * Permission is hereby granted to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 */ 

package com.modularlessonplayer.modules.common 
{
	
	/**
	 *	Interface for a fla containing assets to be grabbed by the loading SkinManagerModule.
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author Lindsey Fallow
	 *	@since  05.12.2009
	 */
	public interface ISkinFla 
	{
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
		
		/*
		
		Implement this however your skin provider is expecting it.
		For example: 
		in the fla...
		assetsList['PlayPauseButton'] = new mcPlayPauseButton();
		*/
		
		function getAssetsList():Array;
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
	}
	
}
