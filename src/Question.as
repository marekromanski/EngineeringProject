package  
{
	/**
	 * ...
	 * @author Marek Romański
	 */
	public class Question 
	{
		private static var allQuestions:Vector.<Question>;
		
		private var _name:String;
		private var _text:String;
		private var _defaultText:String;
		private var _results:Vector.<String>;
		
		
		public function Question(question:Object) 
		{
			_name = question.name;
			_text = question.text;
			if(question.hasOwnProperty("defaultText"))
				_defaultText = question.defaultText;
			else
				_defaultText = "Nie wiem";
			_results = new Vector.<String>();
			if(question.hasOwnProperty("results"))
				addResults(question.results);
			
			if (!allQuestions)
				allQuestions = new Vector.<Question>();
			allQuestions.push(this);
		}
		
		public function get text():String 
		{
			return _text;
		}
				
		private function  addResults(results:Array):void 
		{
			for each (var result:Object in results) 
			{
				_results.push(result.toString());
			}
		}
		
		public static function addToInterview(question:String):Boolean 
		{
			var added:Boolean = false;
			for each (var q:Question in allQuestions) 
			{
				if (q._name == question)
				{
					DialogBox.dialogBox.addOption(q._name, q.showResults,  DialogBox.dialogBox.interview);
					added = true;
					break;
				}
			}
			return added;
		}
		
		public function showResults():void 
		{
			var forDisplay:Array = new Array();
			for each (var result:String in _results) 
			{
				switch (result) 
				{
					case "sex":
						forDisplay.push(Patient.currentPatient.sex);
						break;
					case "age":
						forDisplay.push(Patient.currentPatient.age);
					break;
					case "weight":
						forDisplay.push(Patient.currentPatient.weight);
					break;
					
					default:
						var id:int = Patient.currentPatient.getSymptomIndex(result);
						if (id > -1)
							forDisplay.push(Patient.currentPatient.symptoms[id]);
						else
							forDisplay.push(_defaultText);

				} 
			}
			for each (var obj:Object in Array) 
			{
				trace(obj.toString());
			}
		}
	}
}