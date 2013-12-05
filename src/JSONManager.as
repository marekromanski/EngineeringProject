package  
{
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	//import org.osflash.signals.DeluxeSignal;
	//import org.osflash.signals.Signal;
	/**
	 * ...
	 * @author Marek Romański
	 */
	public class JSONManager 
	{
		private static var isLoading:Boolean;
		private static var destination:Object;
		private static var onComplete:Function;
		static private var loader:URLLoader;
		static private var request:URLRequest;
		
		public static function loadJSON(path:String, onComp:Function):void 
		{	
			if (!isLoading)
			{
				onComplete = onComp;
				loader = new URLLoader();
				request = new URLRequest();
				request.url = path;
				loader.addEventListener(Event.COMPLETE, onLoadComplete);
				loader.load(request);
			}
			else
			{
				trace("Ongoing loading, plz try again later");
			}
		}
		
		private static function onLoadComplete(e:Event):void
		{
			Content.json = JSON.parse(e.target.data);
			onComplete();
			//clear();
		}
		
		public static function saveJSON(path:String, data:Object):void 
		{
			var file:File = File.applicationStorageDirectory;
			file = file.resolvePath(path);
			//file
			trace(file.nativePath);
			var tmp:Object = new Object();
			tmp.board = data;
			var sData:String = JSON.stringify(tmp);
			var stream:FileStream = new FileStream();
			stream.open(file, FileMode.WRITE); 
			stream.writeMultiByte(sData, "utf-8");
			stream.close();
		}
		
		public static function clear():void 
		{
			loader.removeEventListener(Event.COMPLETE, onLoadComplete);
			loader = null;
			request = null;
		}
	}

}