package  
{
	/**
	 * ...
	 * @author Marek Romański
	 */
	public class Symptom 
	{
		private var _name:String;
		private var _text:String;
		private var _unlocks:Vector.<String>;
		private var _unlocked:Boolean;
		
		//public static var symptoms:Vector.<Symptom> = new Vector.<Symptom>();
		
		public function Symptom(symptom:Object) 
		{
			if(symptom.hasOwnProperty("name"))
				_name = symptom.name;
			else
				_name = "Symptom has no name";
			if(symptom.hasOwnProperty("text"))
				_text = symptom.text;
			else
				_text = "Symptom has no description";
			_unlocks = new Vector.<String>();
			
			if (symptom.hasOwnProperty("unlocks"))
				for each (var option:String in symptom.unlocks) 
				{
					_unlocks.push(option);
				}
			else
				trace("Symptom has no 'unlocks' list");
			
			_unlocked = false;
			//symptoms.push(this);
		}
		
		public function get name():String
		{
			return _name;
		}
		public function get text():String 
		{
			return _text;
		}
		public function get unlocks():Vector.<String> 
		{
			return _unlocks;
		}
		public function set unlocked(val:Boolean):void 
		{
			_unlocked = val;
		}
		
	}

}