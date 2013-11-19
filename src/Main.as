package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author Marek Romański
	 */
	public class Main extends Sprite 
	{
		private static var _windowWidth:int;
		private static var _windowHeight:int;
		private var _starling:Starling;
		private var _viewport:Rectangle;
		
		public static function get windowWidth():int
		{
			return _windowWidth
		}
		public static function get windowHeight():int
		{
			return _windowHeight;
		}
		
		public function Main():void 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, init, false, 0, true);
		}
		public function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			//_windowHeight = stage.fullScreenHeight;
			//_windowWidth = stage.fullScreenWidth;
			_windowHeight = stage.stageHeight;
			_windowWidth = stage.stageWidth;
			_viewport = new Rectangle(0, 0, _windowWidth, _windowHeight);
			
			_starling = new Starling(Game, this.stage);
			_starling.start();
			
			
		}
		
	}
	
}