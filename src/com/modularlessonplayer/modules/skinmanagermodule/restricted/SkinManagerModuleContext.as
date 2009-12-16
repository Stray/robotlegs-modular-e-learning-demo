package com.modularlessonplayer.modules.skinmanagermodule.restricted {
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;
	import org.robotlegs.utilities.modular.mvcs.ModuleContextView;
	
	import com.modularlessonplayer.modules.skinmanagermodule.restricted.SkinManagerModuleMediator;
	import com.modularlessonplayer.modules.skinmanagermodule.restricted.controller.LoadSkinCommand;
	import com.modularlessonplayer.modules.skinmanagermodule.restricted.services.SkinLoaderService;
	
	public class SkinManagerModuleContext extends ModuleContext {
		
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
		
		public function SkinManagerModuleContext(contextView:ModuleContextView) {
			
			// there's no autostartup in this context because the module requires the event dispatcher before you do startup
			
			super(contextView);
		
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
			trace("SkinManagerModuleContext startup running");
			
			// this has no purpose other than to make it obvious what you've done wrong...
			
			if(!_isModuleDispatcherSet){
				trace("DIAGNOSTIC HELPER: You need to set up the module dispatcher before you can run startup. If your app bails now... you'll know why.")
			}
			
			// Map some Commands to Events
			commandMap.mapEvent(ContextEvent.STARTUP, LoadSkinCommand, ContextEvent, true);
			
			// Dependency injection for models, services and values
			injector.mapSingleton(SkinLoaderService);
			// injector.mapClass(whenAskedFor:Class, instantiateClass:Class, named:String = null);
			// injector.mapValue(whenAskedFor:Class, useValue:Object, named:String = null);
			// injector.mapSingletonOf(whenAskedFor:Class, useSingletonOf:Class, named:String = null);
			
			// Bind Mediators to Views
			// The mediators are created automatically when the view is added to stage (within contextView)
			// mediatormap.mapView(ViewClass, MediatorClass);
			// or - if your view is already on stage
			// mediatorMap.createMediator(viewObject);
			mediatorMap.mapView(SkinManagerModule, SkinManagerModuleMediator);
			
			
			// and we're done
			super.startup();
			
			// fire!
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}
		
		
		
	}
}
