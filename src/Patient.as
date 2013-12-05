package  
{
	/**
	 * ...
	 * @author Marek Romański
	 */
	public class Patient 
	{
		public static const tNormal:String = "w normie";
		public static const tLowered:String = "obniżona";
		public static const tHigh:String = "podwyższona";
		public static const tFever:String = "gorączka";
		
		private static var _currentPatient:Patient;
		
		public static var maleNameSet:Vector.<String>;
		public static var femaleNameSet:Vector.<String>;

		public static var ailmentSet:Vector.<Ailment>;
		
		public var name:String;
		private var _isMale:Boolean;
		public var weight:int;
		
		private var _age:Measure;
		private var _temperature:Measure;
		
		public var ailment:Ailment;
		public var symptoms:Vector.<Symptom>;
		//public var otherSymptooms:Object;
		
		//public var performedExaminations:Array;
	
		public function Patient() 
		{
			_isMale = Math.random() < 0.5;
			if (_isMale)
			{
				if(maleNameSet)
					name = maleNameSet[Math.floor(Math.random() * maleNameSet.length)];
				else
					name = "maleNameSet is null";
			}
			else
			{
				if(femaleNameSet)
					name = femaleNameSet[Math.floor(Math.random() * femaleNameSet.length)];
				else
					name = "femaleNameSet is null";
			}
			
			weight = 70;
			initAge();
			if (generalAge == "NA")
			{
				trace("No age category assigned");
				return;
			}
				

			if (Ailment.allAilments)
			{	
				var chosen:Boolean = false;
				while (!chosen) 
				{
					ailment = Ailment.allAilments[Math.floor(Math.random() * Ailment.allAilments.length)];
					if 	( 	
							generalAge == "Młody" && ailment.affectsYoung 		||
							generalAge == "Średni" && ailment.affectsMiddle 	||
							generalAge == "Stary" && ailment.affectsOld 		||
							generalAge == "Bardzo stary" && ailment.affectsVeryOld 
						)
						chosen = true;
				}
			}
			
			initTemperature();
			//load symptoms from model ailments
			symptoms = new Vector.<Symptom>();
			
			for (var symptom:Object in ailment.symptoms)
			{
				symptoms.push(new Symptom(symptom));
			}	
		}
		
		
		public function getSymptomIndex(symptomName:String):int 
		{
			for (var i:int = 0; i < symptoms.length; ++i)
			{
				if (symptomName == symptoms[i].name)
					return i;
			}
			return -1;
		}
		
		
		public function unlockDefaultInterviewOptions():void 
		{
			for each (var option:String in ailment.unlocks) 
			{
				if (!Question.addToInterview(option)) //add question to displayes interview
				{
					trace("Nie znaleziona pytania: " + option);
					//dodaj badanie
				}
			}
		}

		public static function set currentPatient(val:Patient):void 
		{
			if (_currentPatient)
				_currentPatient.clear();
			_currentPatient = val;
		}
		
		public static function get currentPatient():Patient 
		{
			return _currentPatient;
		}
		
		private function initAge():void 
		{
			_age = new Measure("Wiek");
			_age.addVariable(new LinguisticVariable("Młody", 15, 20, 25, 30));
			_age.addVariable(new LinguisticVariable("Średni", 20, 30, 40, 45));
			_age.addVariable(new LinguisticVariable("Stary", 40, 50, 60, 70));
			_age.addVariable(new LinguisticVariable("Bardzo stary", 65, 70, 200, 200));
			
			_age.value = Math.floor(Math.random() * 60) + 15;
		}
		
		private function initTemperature():void 
		{
			_temperature = new Measure("Temperatura");
			_temperature.addVariable(new LinguisticVariable(tLowered, 30, 31, 36.4, 36.5));
			_temperature.addVariable(new LinguisticVariable(tNormal, 36.4, 36.5, 36.6, 36.7));
			_temperature.addVariable(new LinguisticVariable(tHigh, 36.7, 37, 37.5, 38));
			_temperature.addVariable(new LinguisticVariable(tFever, 37.5, 38, 42, 42.5));
			
			if(ailment.temperature)
			//if(false)
			{
				trace(ailment.temperature);
				_temperature.setValueFromRanges(ailment.temperature);
			}
			else
			{
				trace("Nie wylosowano temperatury");
				_temperature.value = 36.6;
			}
		}
		
		public function get temperature():Number 
		{
			return _temperature.value;
		}
		
		public function  get generalTemperature():String
		{
			return _temperature.category;
		}
		
		public function get sex():String
		{
			if (_isMale)
				return "Mężczyzna";
			else
				return "Kobieta";
		}
		
		public function get age():String
		{
			return _age.value.toString();
		}
		
		public function get generalAge():String 
		{
			return _age.category;
		}
		
		private function clear():void 
		{
			_currentPatient = null;
		}
		
	}

}