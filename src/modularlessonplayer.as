package {
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	
	import org.robotlegs.utilities.modular.GenericModule;
	
	import com.modularlessonplayer.modules.lessonnavmodule.restricted.LessonNavModule;
	import com.modularlessonplayer.modules.modulemanager.restricted.ModuleManager;
	import com.modularlessonplayer.modules.lessonloadermodule.restricted.LessonLoaderModule;
	import com.modularlessonplayer.modules.skinmanagermodule.restricted.SkinManagerModule;
	import com.modularlessonplayer.modules.loggingmodule.restricted.LoggingModule;
	
	public class modularlessonplayer extends Sprite {

		public function modularlessonplayer() {
			trace("modularlessonplayer instantiated!");
			init();
		}
		
		private function init():void{
			var moduleManager:ModuleManager = new ModuleManager();
			this.addChild(moduleManager);
			
			var navModule:LessonNavModule = new LessonNavModule();
			var lessonLoader:LessonLoaderModule = new LessonLoaderModule();
			var skinManager:SkinManagerModule = new SkinManagerModule();
			var loggingModule:LoggingModule = new LoggingModule();
			
			navModule.y = 500;
			navModule.x = 300;
			
			lessonLoader.x = 20;
			lessonLoader.y = 20;
			
			var moduleVector:Vector.<GenericModule> = new Vector.<GenericModule>();
			moduleVector[moduleVector.length] = navModule;
			moduleVector[moduleVector.length] = lessonLoader;
		    moduleVector[moduleVector.length] = skinManager;
			moduleVector[moduleVector.length] = loggingModule;
			
			moduleManager.integrateModules(moduleVector);
			
		}
		
	}
}
