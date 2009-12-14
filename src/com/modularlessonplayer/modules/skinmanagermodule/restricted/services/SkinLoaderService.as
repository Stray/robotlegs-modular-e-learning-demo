package com.modularlessonplayer.modules.skinmanagermodule.restricted.services {
	
	import org.robotlegs.mvcs.Actor;
	
	import flash.events.Event;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.system.LoaderContext;
	import flash.net.URLRequest;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.system.ApplicationDomain;
	import flash.utils.Dictionary;
	import flash.utils.ByteArray;
	
	import com.modularlessonplayer.modules.skinmanagermodule.restricted.events.SkinLoadedEvent;
	import com.modularlessonplayer.modules.common.ISkinFla;
	
	
	public class SkinLoaderService extends Actor{
		
		/* INHERITED INJECTIONS:
		[Inject(name='mvcsEventDispatcher')]
		public var eventDispatcher:IEventDispatcher;
		
		[Inject(name='mvcsEventMap')]
		public var eventMap:IEventMap;
		*/ 
		
		private var skinSourceName:String;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * No comment. 
		 * 
		 */
		public function SkinLoaderService() 
		{
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  API
		//
		//--------------------------------------------------------------------------
		
		public function loadSkin(skinPath:String):void {
		    trace("loadSkin : " + skinPath);
			skinSourceName = skinPath.split("/").pop();
			var urlLoader:URLLoader = new URLLoader();
			urlLoader.dataFormat = URLLoaderDataFormat.BINARY;
			var urlRequest:URLRequest = new URLRequest(skinPath);
			urlLoader.addEventListener(Event.COMPLETE, bytesLoadedHandler);
			urlLoader.load(urlRequest);
		}
		
		//--------------------------------------------------------------------------
		//
		//  API
		//
		//--------------------------------------------------------------------------
		
		private function bytesLoadedHandler(e:Event):void{
			trace("skin Bytes loaded");
			var urlLoader:URLLoader = e.target as URLLoader;
			var swfBytes:ByteArray = urlLoader.data as ByteArray;
			
			var swfLoader:Loader = new Loader();
			swfLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onSwfLoadComplete);
			var loaderContext:LoaderContext = new LoaderContext();
			// not needed unless it's air
			// loaderContext.allowLoadBytesCodeExecution = true;
			
			loaderContext.applicationDomain = ApplicationDomain.currentDomain;
			swfLoader.loadBytes(swfBytes);
		}
		
		private function onSwfLoadComplete(e:Event):void{
			trace("onSwfLoadComplete");
			var loaderInfoObj:LoaderInfo = e.target as LoaderInfo;
			var contentMCTest:* = loaderInfoObj.content;
			var contentMC:ISkinFla = loaderInfoObj.content as ISkinFla;
			var skinArray:Array = contentMC.getAssetsList();
			var skinLoadedEvent:SkinLoadedEvent = new SkinLoadedEvent(SkinLoadedEvent.SKIN_LOADED, skinArray, skinSourceName);
			eventDispatcher.dispatchEvent(skinLoadedEvent);
		}
		
	}
}
