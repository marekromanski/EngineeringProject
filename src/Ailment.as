package  
{
	/**
	 * ...
	 * @author Marek Romański
	 */
	public class Ailment 
	{
		public var name:String;
		
		public var affectsYoung:Boolean;
		public var affectsMiddle:Boolean;
		public var affectsOld:Boolean;
		public var affectsVeryOld:Boolean;
		
		public var symptoms:Vector.<Symptom>;
		
		public function Ailment(nam:String, young:Boolean, middle:Boolean, old:Boolean, veryOld:Boolean ) 
		{
			name = nam;
			
			affectsMiddle = middle;
			affectsOld = old;
			affectsVeryOld = veryOld;
			affectsYoung = young;
			
			symptoms = new Vector.<Symptom>();
		}
		
		public function addSymptom(symptom:Symptom):void 
		{
			symptoms.push(symptom);
		}
	}

}