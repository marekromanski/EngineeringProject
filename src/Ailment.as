package  
{
	/**
	 * ...
	 * @author Marek Romański
	 */
	public class Ailment 
	{
		public static var allAilments:Vector.<Ailment> = new Vector.<Ailment>();
		
		private var _name:String;
		
		private var _affectsYoung:Boolean;
		private var _affectsMiddle:Boolean;
		private var _affectsOld:Boolean;
		private var _affectsVeryOld:Boolean;
				
		private var _cause:String;
		private var _temperature:Vector.<String>;
		private var _symptoms:Array;
		private var _unlocks:Array;
		
		public function Ailment(ailment:Object ) 
		{
			if(ailment.hasOwnProperty("name"))
				_name = ailment.name;
			else
				_name = "Brak nazwy";
			if (ailment.hasOwnProperty("cause"))
			{
				_cause = ailment.cause;
			}
			else
				trace("Brak przyczyny wizyty");
			if (ailment.hasOwnProperty("unlocks"))
			{
				_unlocks = ailment.unlocks;
			}
			else
			{
				trace("Brak listy unlocks");
				_unlocks = new Array();
			}
			
			if (ailment.hasOwnProperty("affectsMiddle"))
				_affectsMiddle = ailment.affectsMiddle;
			if (ailment.hasOwnProperty("affectsOld"))
				_affectsOld = ailment.affectsOld;
			if(ailment.hasOwnProperty("affectsVeryOld"))
				_affectsVeryOld = ailment.veryOld;
			if(ailment.hasOwnProperty("affectsYoung"))
				_affectsYoung = ailment.affectsYoung;
			_temperature = new Vector.<String>();	
			if (ailment.hasOwnProperty("temperature"))
			{
				for each( var temp:String in ailment.temperature)
					_temperature.push(temp);
			}
			else
			{
				_temperature.push(Patient.tNormal);
			}
			
			if(ailment.hasOwnProperty("symptoms"))
				_symptoms = ailment.symptoms;
			else 
				_symptoms = new Array();
				
			allAilments.push(this);
		}
		
		public function get affectsYoung():Boolean 
		{
			return _affectsYoung;
		}
		public function get affectsMiddle():Boolean 
		{
			return _affectsMiddle
		}
		public function get affectsOld():Boolean 
		{
			return _affectsOld
		}
		public function get affectsVeryOld():Boolean 
		{
			return _affectsVeryOld
		}
		public function get temperature():Vector.<String> 
		{
			return _temperature
		}
		public function get cause():String 
		{
			return _cause;
		}
		
		public function get symptoms():Array 
		{
			return _symptoms;
		}
		
		public function get unlocks():Array 
		{
			return _unlocks;
		}
		/*public function addSymptom(symptom:Symptom):void 
		{
			symptoms.push(symptom);
		}*/
	}

}