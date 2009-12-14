package com.modularlessonplayer.modules.skinmanagermodule.restricted {
	
	import org.robotlegs.utilities.modular.GenericModule;
	
	import flash.display.Sprite;
	import flash.utils.Dictionary;
	import flash.display.DisplayObject;
	
	import com.modularlessonplayer.modules.common.ISkinProvider;
	import com.modularlessonplayer.modules.common.ISkinnableView;
	
	
	public class SkinManagerModule extends GenericModule implements ISkinProvider 
	{
				
		private var _assetsList:Array;
		
		public function SkinManagerModule():void
		{
			trace("SkinManagerModule instantiated");
			context = new SkinManagerModuleContext(this);
			
			init();
		}
		
		private function init():void{
			
			_assetsList = [];
			
		}
		
		public function getSkin(spriteToSkin:Sprite):Sprite{
			trace("spriteToSkin: " + spriteToSkin);
			var spriteName:String = spriteToSkin.toString();
			trace("spriteName: " + spriteName);
			if(_assetsList[spriteName] != null){
				var spriteInstance:Sprite = _assetsList[spriteName];
				// make a copy
				var targetClass:Class = Object(spriteInstance).constructor;
				var duplicate:Sprite = new targetClass() as Sprite;
				return duplicate;
			}
			
			return null;
		}
		
		internal function appendAssetsList(assetsList:Array):void{
			trace("appendAssetsList");
			for (var key:String in assetsList)
			{
			    trace(key, assetsList[key]);
				if(_assetsList[key] == null){
					_assetsList['[object '+key+']'] = assetsList[key];
				}
			}
		}
	
	}
}
