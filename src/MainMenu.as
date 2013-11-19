package  
{
	import flash.display3D.textures.Texture;
	import flash.geom.Point;
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.TouchEvent;
	/**
	 * ...
	 * @author Marek Romański
	 */
	
	 
	 
	 
	public class MainMenu extends Sprite
	{		
		public var buttons:Vector.<MyButton>;
		//public var labels:Vector.<TextField>;
		public var background:Image;
		public function MainMenu() 
		{
			buttons = new Vector.<MyButton>();
			addButton("START GAME", new Point(0.5, 0.4), 200, 80, startGame);
			addButton("QUIT", new Point(0.5, 0.6), 200, 80, quitGame);
		}
		
		public function addButton(text:String, position:Point, width:Number, height:Number, onClick:Function):void 
		{
			var b:MyButton = new MyButton(text, onClick);
			
			b.width = width;
			b.height = height;
			//b.x = 100;
			b.x = Starling.current.stage.stageWidth * position.x - width / 2;
			b.y = Starling.current.stage.stageHeight * position.y - height	/ 2;
			addChild(b);
			buttons.push(b);
		}
		
		private function startGame():void 
		{
			clearMenu();
			Game.game.showGameScreen();
		}
		
		private function quitGame():void 
		{
			clearMenu();
			Game.game.quitGame();
		}
		
		public function clearMenu():void 
		{
			for each(var b:MyButton in buttons)
				b.clear();
			buttons = null;
			
			removeChild(background);
			background = null;
		}
	}

}