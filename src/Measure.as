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
			var name:String;
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
	}
}
