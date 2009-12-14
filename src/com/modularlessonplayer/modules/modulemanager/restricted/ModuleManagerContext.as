package com.modularlessonplayer.modules.modulemanager.restricted {
	
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.core.IMediatorMap;
	import org.robotlegs.mvcs.Context;
	
	import org.robotlegs.utilities.modular.GenericModuleContext;
	import org.robotlegs.utilities.modular.ModuleEventDispatcher;
	import org.robotlegs.utilities.modular.GenericModule;
	
	import __AS3__.vec.Vector;
	
  	
	
	public class ModuleManagerContext extends GenericModuleContext {
		
		//private var _modulesList:Vector.<Context>;
		
		private var _moduleEventDispatcher:ModuleEventDispatcher;		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Factory method. Provide the Context with the necessary objects to do its work.
		 * Note that the both the injector and reflector are programmed to interfaces
		 * so you can freely change the IoC container and Reflection library you want
		 * to use as long as the 'contract' is fullfilled. See the adapter package
		 * in the RobotLegs source.
		 *
		 * @param contextView DisplayObjectContainer
		 * @param autoStartup Boolean
		 *
		 */
		
		public function ModuleManagerContext(contextView:GenericModule) {
			
			super(contextView);
			
			var moduleEventDispatcher:ModuleEventDispatcher = new ModuleEventDispatcher();
			setModuleDispatcher(moduleEventDispatcher);
			_moduleEventDispatcher = moduleEventDispatcher;
			
			startup();
		
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overridden API
		//
		//--------------------------------------------------------------------------
		/**
		 * Gets called by the framework if autoStartup is true. Here we need to provide
		 * the framework with the basic actors. The proxies/services we want to use in
		 * the model, map some view components to Mediators and to get things started,
		 * add some Sprites to the stage. Only after we drop a Sprite on the stage,
		 * RobotLegs will create the Mediator. 
		 *
		 */
		override public function startup():void
		{	
			trace("Startup");
			// Map some Commands to Events
			// commandMap.mapEvent(MyCommand, MyEvent.EVENT_NAME, MyEvent, isOneShot);
			
			// Dependency injection for models, services and values
			// injector.mapSingleton(whenAskedFor:Class, named:String = null);
			// injector.mapClass(whenAskedFor:Class, instantiateClass:Class, named:String = null);
			// injector.mapValue(whenAskedFor:Class, useValue:Object, named:String = null);
			// injector.mapSingletonOf(whenAskedFor:Class, useSingletonOf:Class, named:String = null);
			
			// Bind Mediators to Views
			// The mediators are created automatically when the view is added to stage (within contextView)
		    // mediatorMap.mapView(ModuleContextBase, ModuleMediator);
			// or - if your view is already on stage
			// mediatorMap.createMediator(viewObject);
			
			// and we're done
			super.startup();
			
			
		}
		
		
		public function integrateModules(modulesList:Vector.<GenericModule>):void{
			for each (var nextModule:GenericModule in modulesList){
				trace("nextModule = " + nextModule);
				
				nextModule.setModuleDispatcher(_moduleEventDispatcher);
				nextModule.startup();
			   	
				this.contextView.addChild(nextModule);
			
			}
		}
		
		
	}
}
