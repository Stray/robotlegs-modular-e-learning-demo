package com.modularlessonplayer.modules.loggingmodule.restricted {
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.utilities.modular.GenericModuleContext;
	import org.robotlegs.utilities.modular.GenericModule;
	
	import com.modularlessonplayer.modules.loggingmodule.restricted.services.ILoggingService;
	import com.modularlessonplayer.modules.loggingmodule.restricted.services.TraceLoggingService;
	import com.modularlessonplayer.modules.loggingmodule.restricted.services.TextFieldLoggingService;
	
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class LoggingModuleContext extends GenericModuleContext {
		
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
		
		public function LoggingModuleContext(contextView:GenericModule) {
			
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
			trace("LoggingModuleContext startup running");
			
			// this has no purpose other than to make it obvious what you've done wrong...
			
			if(!_isModuleDispatcherSet){
				trace("DIAGNOSTIC HELPER: You need to set up the module dispatcher before you can run startup. If your app bails now... you'll know why.")
			}
			
			// Map some Commands to Events
		    // moduleCommandMap.mapEvent(ContextEvent.STARTUP, UpdateLogCommand, LoggingEvent, true);
			
			// Dependency injection for models, services and values
			// injector.mapSingleton(LessonLoaderService);
			// injector.mapClass(whenAskedFor:Class, instantiateClass:Class, named:String = null);
			
			var logTextField:TextField = createLogTextField();
			
			injector.mapValue(TextField, logTextField, "logTextField");
			injector.mapSingletonOf(ILoggingService, TextFieldLoggingService);
			
			// Bind Mediators to Views
			// The mediators are created automatically when the view is added to stage (within contextView)
			// mediatormap.mapView(ViewClass, MediatorClass);
			// or - if your view is already on stage
			// mediatorMap.createMediator(viewObject);
			mediatorMap.mapView(LoggingModule, LoggingModuleMediator);
			//mediatorMap.mapView(LessonView, LessonViewMediator);
			
			
			// and we're done
			super.startup();
			
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
			
		}
		
		private function createLogTextField():TextField{
			var logTextField:TextField = new TextField();
			logTextField.x = 600;
			logTextField.y = 20;
			logTextField.width = 350;
			logTextField.height = 500;
			logTextField.border = true;
			logTextField.multiline = true;
			logTextField.wordWrap = true;
			logTextField.background = true;
			logTextField.defaultTextFormat = new TextFormat("_sans");
			contextView.addChild(logTextField);
			return logTextField;
		}
		
		
	}
}
