package com.modularlessonplayer.modules.skinmanagermodule.restricted.controller {
	
	import org.robotlegs.mvcs.Command;
	import com.modularlessonplayer.modules.skinmanagermodule.restricted.services.SkinLoaderService;
	
	public class LoadSkinCommand extends Command{
		
		[Inject]
		public var skinLoaderService:SkinLoaderService;
		
		
		public function LoadSkinCommand() {
		}
		
		override public function execute():void {
			
			var randomSkin:String = "skinRed/navButtonsSkinRed.swf";
			if(Math.random()<0.5){
				randomSkin = "skinBlue/navButtonsSkinBlue.swf"
			}
			
			skinLoaderService.loadSkin("../assets/skins/lessonEnvironment/" + randomSkin);
		  
		} 
	}
}
