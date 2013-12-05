package  
{
	/**
	 * ...
	 * @author Marek Romański
	 */
	public class Examination extends Question
	{
		
		public function Examination(text:String, cost:int, results:Array) 
		{
			super(text, results);
			_cost = cost;
		}
		
		public function get cost():int 
		{
			return _cost;
		}
		
	}

}