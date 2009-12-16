package com.modularlessonplayer.modules.lessonnavmodule.restricted.view {
	
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	import flash.events.Event;
	
	import com.modularlessonplayer.modules.common.ISkinnableView;
	
	public class PlayPauseButton extends Sprite implements ISkinnableView {
		 
		
		[Embed(source='/skins/lessonEnvironment/navButtonsSkin.swf', symbol="mcPlayPauseButton")]
		private var MCPlayPauseButton:Class;
		
		private var playIcon:DisplayObject;
		private var pauseIcon:DisplayObject;
		
		private var _isPlaying:Boolean = false;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Event handling takes place via the mediator: PlayPauseButtonMediator 
		 * 
		 */
		
		public function PlayPauseButton() {			
			init();
		}
	   
		private function init():void{
			var playPauseButtonSwf:Sprite = new MCPlayPauseButton();
			setSkin(playPauseButtonSwf);
		}
		
		
		public function setSkin(skinMC:Sprite):void{
			
			removeCurrentSkin();
			
			addChild(skinMC);
			
			playIcon = skinMC['mc_playIcon'];
			pauseIcon = skinMC['mc_pauseIcon'];
			
			setIsPlaying(_isPlaying);
			
		}
		
		private function removeCurrentSkin():void{
			var iLength:uint = numChildren;
			for (var i:uint = 0; i<iLength; i++){
				removeChildAt(i);
			}
		}
		
		public function setIsPlaying(isPlaying:Boolean):void{
			_isPlaying = isPlaying;
			playIcon.visible = !_isPlaying;
			pauseIcon.visible = _isPlaying;
		}
			
				
	}
}
