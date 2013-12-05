package  
{
	import flash.geom.Point;
	import starling.display.DisplayObject;
	import starling.display.Quad;
	import starling.display.Sprite;
	/**
	 * ...
	 * @author Marek Romański
	 */
	public class Window extends Sprite
	{
		public var displayedObjects:Array;
		public var background:Quad;
		public function Window(width:int, height:int, x:int = 0, y:int = 0) 
		{
			this.width = width;
			this.height = height;
			this.x = x;
			this.y = y;
			background = new Quad(width, height, 0x00aa00);
			addChild(background);
			displayedObjects = new Array();
		}
		
		public function display(object:DisplayObject, position:Point):void 
		{
			position.x = position.x < 0 ? 0 : position.x > 1 ? 1 : position.x;
			position.y = position.y < 0 ? 0 : position.y > 1 ? 1 : position.y;
			
			object.x += position.x * this.width;
			object.y += position.y * this.height;
			addChild(object);
			displayedObjects.push(object);
		}
		
		public function clear():void 
		{
			removeChild(background);
			background.dispose();
			background = null;
			
			for each (var object:DisplayObject in displayedObjects) 
			{
				removeChild(object);
				object.dispose();
				object = null;
			}
		}
		
	}

}