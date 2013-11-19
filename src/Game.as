package  
{
	import flash.desktop.NativeApplication;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	/**
	 * ...
	 * @author Marek Romański
	 */
	public class Game extends Sprite
	{
		public static var game:Game;
		public var mainMenu:MainMenu;
		public var gameScreen:GameScreen;
		public var baseBackground:Image;
		
		public function Game() 
		{
			if (!game)
			{
				game = this;
				super();
				this.addEventListener(Event.ADDED_TO_STAGE, init);
			}
			else
			{
				trace("We're trying to make another game!");
			}
		}
		
		private function init(e:Event):void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.color = 0x77a797;
			Content.loadMaleNames();
			//showMainMenu();
		}
		
		public function showMainMenu():void 
		{
			mainMenu = new MainMenu();
			addChild(mainMenu);
		}
		
		public function showGameScreen():void 
		{
			gameScreen = new GameScreen();
			addChild(gameScreen);
		}
		
		public function quitGame():void 
		{
			NativeApplication.nativeApplication.exit();
		}
		
		public function executePrzeswietlenie():void 
		{
			trace("Wykonano prześwietlenie");
		}
		
		public function executeBadanieGardla():void 
		{
			trace("Wykonano badanie gardła");
		}
		
	}

}