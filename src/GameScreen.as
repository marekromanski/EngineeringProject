package  
{
	import flash.geom.Point;
	import starling.display.Quad;
	import starling.display.Sprite;
	/**
	 * ...
	 * @author Marek Romański
	 */
	public class GameScreen extends Sprite
	{
		public var mainWindow:Window;
		public var secondaryWindow:Window;
		public var dialogWindow:Window;
		public var gameMenuWindow:Window;
		
		public var currentPatient:Patient;
		public var currentPatientCard:PatientCard;
		public function GameScreen() 
		{
			currentPatient = new Patient();
			
			
			mainWindow = new Window(Main.windowWidth * 0.6, Main.windowHeight * 0.7, Main.windowWidth * 0.02, Main.windowHeight * 0.025);
			addChild(mainWindow);
			
			secondaryWindow = new Window(Main.windowWidth * 0.34, Main.windowHeight * 0.7, Main.windowWidth * 0.64, Main.windowHeight * 0.025);
			addChild(secondaryWindow);
			currentPatientCard = new PatientCard(secondaryWindow.width, secondaryWindow.height, currentPatient);
			secondaryWindow.addChild(currentPatientCard);
			//currentPatientCard.x += secondaryWindow.width * 0.025;
			
			dialogWindow = new DialogBox(Main.windowWidth * 0.6, Main.windowHeight * 0.225, Main.windowWidth * 0.02, Main.windowHeight * 0.75);
			addChild(dialogWindow);
			
			gameMenuWindow = new Window(Main.windowWidth * 0.34, Main.windowHeight * 0.225, Main.windowWidth * 0.64, Main.windowHeight * 0.75);
			addChild(gameMenuWindow);
		}
		
	}

}