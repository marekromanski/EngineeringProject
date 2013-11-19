package  
{
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextField;
	/**
	 * ...
	 * @author Marek Romański
	 */
	public class DialogOption
	{
		//private var _id:int;
		private var _text:String;
		private var _onClick:Function;
		private var _args:Array;
		
		public function DialogOption(text:String, onClick:Function, ...args) 
		{
			//_id = availableOptions++;
			_onClick = onClick;
			_text = text;
			//if(args.length > 0)
			_args = args;
		}
		
		public function get text():String
		{
			return _text;
		}
		public function get onClick():Function 
		{
			return _onClick;
		}
		
		public function  get args():Array
		{
			return _args;
		}
		
		
	}

}