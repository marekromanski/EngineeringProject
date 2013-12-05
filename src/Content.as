package  
{
	/**
	 * ...
	 * @author Marek Romański
	 */
	public class Content 
	{
		public static var json:Object;
		public static var targetVector:Vector.<String>;
		public static var onComplete:Function;
		
		public static function loadMaleNames():void 
		{
			if (!Patient.maleNameSet)
				Patient.maleNameSet = new Vector.<String>();
			targetVector = Patient.maleNameSet;
			onComplete = loadFemaleNames;
			JSONManager.loadJSON("JSONs/maleNames.json", parseNames);
		}
		
		public static function loadFemaleNames():void 
		{
			if (!Patient.femaleNameSet)
				Patient.femaleNameSet = new Vector.<String>();
			targetVector = Patient.femaleNameSet;
			onComplete = loadAilments;
			JSONManager.loadJSON("JSONs/femaleNames.json", parseNames);
		}
		
		public static function parseNames():void 
		{
			if (!targetVector)
				targetVector = new Vector.<String>();
			for each (var name:String in json.names) 
			{
				targetVector.push(name);
			}
			if(Boolean(onComplete))
				onComplete();
		}
		
		public static function loadAilments():void 
		{
			JSONManager.loadJSON("JSONs/ailments.json", parseAilments);
		}
		
		static private function parseAilments():void 
		{
			for each( var obj:Object in json.ailments)
			{
				new Ailment(obj);
				//var ailment:Ailment = new Ailment(obj);
				//Ailment.allAilments.push(ailment);
				//trace(ailment);
			}
			Game.game.showMainMenu();;
		}
		public static function loadQuestions():void 
		{
			JSONManager.loadJSON("JSONs/questions.json", parseQuestions);
		}
		
		static private function parseQuestions():void 
		{
			for each( var obj:Object in json.questions)
			{
				new Question(obj);
			}
		}
		
	}

}