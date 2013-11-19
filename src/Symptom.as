package  
{
	/**
	 * ...
	 * @author Marek Romański
	 */
	public class Symptom 
	{
		private var _name:String;
		
		//private var _isReal:Boolean;
		//private var _isString:Boolean;
		//
		//private var _realFrom:Number;
		//private var _realTo:Number;
		
		private var _sValue:String;
		//private var _nValue:Number;
		
		public static var symptoms:Vector.<Symptom> = new Vector.<Symptom>();
		
		public function Symptom(name:String, sVal:String = null) 
		{
				_name = name;
				if(sVal)
					_sValue = sVal;
				
				symptoms.push(this);
		}
		
		public function get name():String
		{
			var result:String = _name;
			if (_sValue)
				result += (" " + _sValue);
			//if (_nValue)
				//result += (" " + 
			return result;
		}
		
	}

}