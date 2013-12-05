package  
{
	/**
	 * ...
	 * @author Marek Romański
	 */
	public class Measure 
	{
		public var name:String;
		
		private var _value:Number;
		private var _variables:Vector.<LinguisticVariable>;
		
		public function Measure(type:String) 
		{
			name = type;
			
			_variables = new Vector.<LinguisticVariable>();
		}
		
		public function addVariable(variable:LinguisticVariable):void 
		{
			_variables.push(variable);
		}
		
		public function set value(val:Number):void 
		{
			_value = val;
		}
		
		public function get value():Number 
		{
			return _value;
		}
		
		public function get category():String
		{
			var name:String = "NA";
			var max:Number = 0;
			
			for each(var variable:LinguisticVariable in _variables)
			{
				var supp:Number = variable.calcSupport(_value);
				if (supp > max)
				{
					max = supp;
					name = variable.name;
				}
			}
			
			return name;
		}
		
		public function setValueFromRanges(ranges:Vector.<String>):void 
		{
			//ranges - "PODWYZSONA, "GORACZKA";
			
			/////TU JEST DUZY BŁAD Z PETLAMI - indeksy ze zlej tablicy sa uzyte
			var begining:Number = 999, ending:Number = 0;
			for each(var name:String in ranges)
			{
				var index:int = -1;
				for (var i:int = 0; i < _variables.length; ++i)
					if (_variables[i].name == name)
					{
						index = i;
						break;
					}
				if ( index > -1)
				{
					begining = begining <= _variables[index].start ? begining : _variables[index].start;
					ending = ending >= _variables[index].end ? ending : _variables[index].end;
				}
			}
			while (true)
			{
				var result:Number = (ending - begining) * Math.random() + begining;
				for each(var lingVariable:LinguisticVariable in _variables)
				{
					if (lingVariable.calcSupport(result) > 0)
					{
						_value = result;
						return;
					}
				}
			}
		}
	}
}
