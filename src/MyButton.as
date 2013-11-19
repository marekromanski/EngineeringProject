package  
{
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author Marek Romański
	 */
	public class MyButton extends Sprite
	{
		
		//[Embed(source = "../bin/Assets/butt_prostokat_ON.png")]
		[Embed(source="../bin/Assets/buton_gotomarketON.png")]
		public static const ButtonTextureOn:Class;
		
		//[Embed(source = "../bin/Assets/butt_prostokat_OFF.png")]
		[Embed(source="../bin/Assets/buton_gotomarketOFF.png")]
		public static const ButtonTextureOff:Class;
		
		private var _name:String;
		private var _button:Button;
		private var _onClick:Function;
		private static var upState:Texture = Texture.fromBitmap(new ButtonTextureOff());
		private static var downState:Texture = Texture.fromBitmap(new ButtonTextureOn());
		
		public function MyButton(text:String, onClick:Function)
		{
			_button = new Button(upState, text, downState);
			_button.fontSize = 34;
			_button.fontBold = true;
			_onClick = onClick;
			addEventListener(TouchEvent.TOUCH, processTouch);
			addChild(_button);
			useHandCursor = true;
		}
		
		public function clear():void 
		{
			removeEventListener(TouchEvent.TOUCH, _onClick);
			parent.removeChild(this);
			removeChild(_button);
			removeEventListeners();
			_button = null;
		}
		
		public function processTouch(e:TouchEvent):void 
		{
			var touch:Touch = e.getTouch(stage);
			if (touch)
			{
				if (touch.phase == TouchPhase.ENDED)
				{
					if (touch.isTouching(this))
						_onClick();
				}
			}
		}
		
	}

}