package  
{
	/**
	 * ...
	 * @author Marek Romański
	 */
	public class LinguisticVariable 
	{
		public var start:Number;
		public var leftMax:Number;
		public var rightMax:Number;
		public var end:Number;
		public var name:String;
		
		public var support:Number;
		
		public function LinguisticVariable(name:String, strt:Number, left:Number, right:Number, en:Number) 
		{
			this.name = name;
			start = strt;
			leftMax = left;
			rightMax = right;
			end = en;
		}
		
		public function calcSupport(value:Number):Number
		{
			if (value < start)
				support = 0;
			else if (value >= start && value < leftMax)
			{
				support = (value - start) / (leftMax - start);
			}
			else if (value >= leftMax && value < rightMax)
			{
				support = (value - leftMax) / (rightMax - leftMax);
			}
			else if ( value >= rightMax && value < end)
			{
				support = (value - rightMax) / (end - rightMax);
			}
			else if (value >= end)
				support = 0;
				
			return support;	
		}
		
		
		
		
	}

}