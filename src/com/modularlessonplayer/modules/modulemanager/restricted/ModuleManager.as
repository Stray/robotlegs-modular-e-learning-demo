package com.modularlessonplayer.modules.modulemanager.restricted {
	
	import org.robotlegs.utilities.modular.mvcs.ModuleContextView;
	import com.modularlessonplayer.modules.modulemanager.restricted.ModuleManagerContext;
		
	public class ModuleManager extends ModuleContextView 
	{
		
		private var moduleManagerContext:ModuleManagerContext;
				
		public function ModuleManager():void
		{
			trace("ModuleManager instantiated");
			moduleManagerContext = new ModuleManagerContext(this);
			context = moduleManagerContext;
			init();
		}
		
		private function init():void{
						
		}
		
		public function integrateModules(modulesList:Vector.<ModuleContextView>):void{
			moduleManagerContext.integrateModules(modulesList);
		}
	
	}
}