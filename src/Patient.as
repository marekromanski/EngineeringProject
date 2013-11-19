package  
{
	/**
	 * ...
	 * @author Marek Romański
	 */
	public class Patient 
	{
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
		public var performedExaminations:Array;
		
		
		public function Patient() 
		{
			_isMale = Math.random() > 0.5;
			if (_isMale) //if male
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
			initTemperature();
			//
			
			//_temperature = new Temperature(Math.random() * 2 + 37.5);
			
			if(ailmentSet)
				ailment = ailmentSet[Math.floor(Math.random() * ailmentSet.length)];
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
			_temperature.addVariable(new LinguisticVariable("Obniżona", 30, 31, 36.4, 36.5));
			_temperature.addVariable(new LinguisticVariable("W normie", 36.4, 36.5, 36.6, 36.7));
			_temperature.addVariable(new LinguisticVariable("Podwyższona", 36.7, 37, 37.5, 38));
			_temperature.addVariable(new LinguisticVariable("Gorączka", 37.5, 38, 42, 42.5));
			
			_temperature.value = (Math.random() - 0.5) * 2 + 37.5;
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
		
	}

}