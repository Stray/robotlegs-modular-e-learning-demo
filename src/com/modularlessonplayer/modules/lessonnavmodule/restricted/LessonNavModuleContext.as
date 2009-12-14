package com.modularlessonplayer.modules.lessonnavmodule.restricted {
	
	import flash.display.Shape;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.utilities.modular.GenericModuleContext;
	import org.robotlegs.utilities.modular.GenericModule;
	import org.robotlegs.utilities.modular.GenericModuleMediator;
	
	import com.modularlessonplayer.modules.lessonnavmodule.restricted.LessonNavModule;
	import com.modularlessonplayer.modules.lessonnavmodule.restricted.LessonNavModuleMediator;
	import com.modularlessonplayer.modules.lessonnavmodule.restricted.view.PlayPauseButton;
	import com.modularlessonplayer.modules.lessonnavmodule.restricted.view.PlayPauseButtonMediator;
	
	
	public class LessonNavModuleContext extends GenericModuleContext {
		
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
		
		public function LessonNavModuleContext(contextView:GenericModule) {
			
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
			trace("LessonNavModuleContext startup running");
			
			// this has no purpose other than to make it obvious what you've done wrong...
			
			if(!_isModuleDispatcherSet){
				trace("DIAGNOSTIC HELPER: You need to set up the module dispatcher before you can run startup. If your app bails now... you'll know why.")
			}
			
			// Map some Commands to Events
			// commandMap.mapEvent(MyCommand, MyEvent.EVENT_NAME, MyEvent, isOneShot);
			// eventMap.mapListener(eventDispatcher, LessonNavEvent.PLAY_LESSON, onSomeLocalEvent);
			// commandMap.mapEvent(LessonEvent.LESSON_PAUSED, PauseNavCommand, LessonEvent);
			
			// Dependency injection for models, services and values
			// injector.mapSingleton(whenAskedFor:Class, named:String = null);
			// injector.mapClass(whenAskedFor:Class, instantiateClass:Class, named:String = null);
			// injector.mapValue(whenAskedFor:Class, useValue:Object, named:String = null);
			// injector.mapSingletonOf(whenAskedFor:Class, useSingletonOf:Class, named:String = null);
			
			// Bind Mediators to Views
			// The mediators are created automatically when the view is added to stage (within contextView)
			// mediatormap.mapView(ViewClass, MediatorClass);
			// or - if your view is already on stage
			// mediatorMap.createMediator(viewObject);
			mediatorMap.mapView(LessonNavModule, LessonNavModuleMediator);
			mediatorMap.mapView(PlayPauseButton, PlayPauseButtonMediator);
			
			
			// and we're done
			super.startup();
			
			init();
		}
		
		private function init():void{
			
			var playPauseButton:PlayPauseButton = new PlayPauseButton();
			
			contextView.addChild(playPauseButton);
			
		}
		
		
	}
}
