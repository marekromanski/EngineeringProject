package  
{
	import flash.display3D.textures.Texture;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.text.TextField;
	/**
	 * ...
	 * @author Marek Romański
	 */
	
	 
	 
	 
	public class PatientCard extends Sprite
	{
		[Embed(source = "../bin/Assets/bg.png")]
		public static const PatientCardBackground:Class;
		
		private var _patient:Patient;
		private static var labelOffset:int;
		
		
		private var _nameField:TextField;
		private var _nameLabel:TextField;
		private var _ageLabel:TextField;
		private var _ageField:TextField;
		private var _sexField:TextField;
		private var _sexLabel:TextField;
		private var _weightField:TextField;
		private var _weightLabel:TextField;
		private var _temperatureLabel:TextField;
		private var _temperatureField:TextField;
		private var _textFieldWidth:Number, _textFieldHeight:Number;
		
		private var _header:TextField;
		
		private var _background:Image;
		
		//private var _backgroundColor:uint;
		
		public function PatientCard(width:int, height:int, patient:Patient) 
		{
			if(patient)
				_patient = patient;
			
			var labelCount:int = 0;
			var fieldCount:int = 0;
			//_backgroundColor = 0xaaaa22;
			_background = Image.fromBitmap(new PatientCardBackground());
			_background.width = width;
			_background.height = height;
			
			_textFieldHeight = height / 15;
			_textFieldWidth = 0.45 * width;
			addChild(_background);
			labelOffset = height * 0.2;
			
			//loadBackground();
			initHeader();
			
			initTextField(_textFieldWidth, _textFieldHeight, _nameLabel, "Imię i nazwisko:", labelCount++, false); 
			initTextField(_textFieldWidth, _textFieldHeight, _sexLabel, "Płeć:", labelCount++, false); 
			initTextField(_textFieldWidth, _textFieldHeight, _ageLabel, "Wiek", labelCount++, false);
			initTextField(_textFieldWidth, _textFieldHeight, _weightLabel, "Waga:", labelCount++, false); 
			initTextField(_textFieldWidth, _textFieldHeight, _temperatureLabel, "Temperatura:", labelCount++, false); 
			
					
			if (_patient)
			{
				initTextField(_textFieldWidth, _textFieldHeight, _nameField, _patient.name, fieldCount++, true); 
				initTextField(_textFieldWidth, _textFieldHeight, _sexField, _patient.sex, fieldCount++, true); 
				initTextField(_textFieldWidth, _textFieldHeight, _ageField, _patient.age + " (" + _patient.generalAge + ")", fieldCount++, true);
				initTextField(_textFieldWidth, _textFieldHeight, _weightField, _patient.weight.toString(), fieldCount++, true); 
				initTextField(_textFieldWidth, _textFieldHeight, _temperatureField, _patient.temperature.toFixed(1) + " (" + _patient.generalTemperature + ")", fieldCount++, true); 
				
				//_nameField = new TextField(0.45 * width, height / 10, patient.name);
				//_sexField = new TextField(0.45 * width, height / 10, patient.sex);
				//_weightField = new TextField(_textFieldWidth, _textFieldHeight, patient.weight.toString());
			}
		}
		
		private function initTextField(width:int, height:int, textField:TextField, text:String, count:int, isValue:Boolean = false):void 
		{
			textField = new TextField(width, height, text);
			textField.y += textField.height * count + labelOffset;
			textField.hAlign = "left";
			if (isValue)
			{
				textField.x += width;
			}
			else
			{
				textField.bold = true;
				textField.x += 0.06 * width;
			}
				
			addChild(textField);
		}
		private function initHeader():void 
		{
			_header = new TextField(width * 0.9, height * 0.1, "Karta Pacjenta".toUpperCase() , "Verdana", 14, 0, true);
			_header.x += width * 0.05;
			_header.y += height * 0.05;
			addChild(_header);
			
		}
		
		public function clear():void 
		{
			removeChild(_background);
			_background.dispose();
			_background = null;
			
			clearTextFields();
			
			
		}
		private function clearTextFields():void 
		{	
			clearTextField(_nameField);
			clearTextField(_nameLabel);
			clearTextField(_sexField);
			clearTextField(_sexLabel);
			clearTextField(_weightField);
			clearTextField(_weightLabel);
		}
		
		private function clearTextField(textField:TextField):void 
		{
			removeChild(textField);
			textField.dispose();
			textField = null;
		}
		

	}

}