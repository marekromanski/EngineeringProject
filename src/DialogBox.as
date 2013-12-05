package  
{
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.display.Sprite;
	import starling.text.TextField;


	/**
	 * ...
	 * @author Marek Romański
	 */
	public class DialogBox extends Window
	{
		private static var _dialogBox:DialogBox;
		
		public static const optionsPerPage:int = 6;
		public static var optionLength:int, optionHeight:int;
		private var _page:int;
		
		private var _defaultOptions:Vector.<DialogOption>;
		private var _examinationOptions:Vector.<DialogOption>;
		private var _diagnosisOptions:Vector.<DialogOption>;
		private var _interviewOptions:Vector.<DialogOption>;
		
		private var _options:Vector.<DialogOption>;
		
		private var _displayedOptions:Vector.<DisplayedOption>;
		private var _displayedFrom:int;
		private var _displayedTo:int;
		
		private var _moreOption:DialogOption;
		private var _lessOption:DialogOption;
		
		public function DialogBox(width:int, height:int, x:int = 0, y:int = 0) 
		{
			super(width, height, x, y);
			optionLength = this.width * 0.95;
			optionHeight = this.height / optionsPerPage;
			background.color = 0xffffff;
			
			initDefaultOptions();
			initExaminationOptions();
			initDiagnosis();
			initInterview();
						
			_displayedOptions = new Vector.<DisplayedOption>(optionsPerPage, true);
			for (var i:int = 0; i < optionsPerPage; ++i)
			{
				_displayedOptions[i] = new DisplayedOption(optionLength, optionHeight); 
				addChild(_displayedOptions[i]);
			}
			
			_moreOption = new DialogOption("Następne", showMore);
			_lessOption = new DialogOption("Poprzednie", showLess);
			displayDefault();
		}
		
		private function initExaminationOptions():void 
		{
			_examinationOptions = new Vector.<DialogOption>();
			addOption("Wróć", displayDefault, _examinationOptions);
			addOption("Prześwietlenie", makeExamination, _examinationOptions, "Prześwietlenie");
			addOption("Badanie gardła", makeExamination, _examinationOptions, "Badanie gardła");
			//addOption("Prześwietlenie", Game.game.executePrzeswietlenie, _examinationOptions);
			//addOption("Badanie bardła", Game.game.executeBadanieGardla, _examinationOptions);
			
		}
		private function initDefaultOptions():void 
		{
			_defaultOptions = new Vector.<DialogOption>();
			addOption("Zadaj pytanie pacjentowi", displayInterview, _defaultOptions);
			addOption("Zleć badanie", displayExaminations, _defaultOptions);
			addOption("Wydaj diagnozę", displayDiagnosis, _defaultOptions);
		}
		
		private function initDiagnosis():void 
		{
			_diagnosisOptions = new Vector.<DialogOption>();
			addOption("Wróć", displayDefault, _diagnosisOptions);
			addOption("Zdiagnozowałem grypę", giveDiagnosis, _diagnosisOptions, "grypa");
		}
		
		private function initInterview():void 
		{
			_interviewOptions = new Vector.<DialogOption>();
			addOption("Wróć", displayDefault, _interviewOptions);
			addOption("Jaka jest przyczyna wizyty", showVisitReason, _interviewOptions); 
		}
		
		private function showVisitReason(...args):void 
		{
			trace("Mam bóle brzucha");
			addOption("Gdzie zlokalizowany jest ból?", showPainLocation, _interviewOptions);
			addOption("Od jak dawna występuje ból?", showPainLength, _interviewOptions);
			addOption("Czy występowały wymioty?", showIfPatientVomited, _interviewOptions);
			addOption("Czy występowało zaparcie?", showIfPatientHasConstipation, _interviewOptions);
			addOption("Czy odczuwa Pan ból przy oddawaniu moczu?", showIfPatientHurtsPisssing, _interviewOptions);
			displayStartingOptions();
		}
		private function showCauseOfVisit():void 
		{
			trace(Patient.currentPatient.ailment.cause);
			//if(
			
		}
		
		
		private function showIfPatientHurtsPisssing(...args):void 
		{
			trace("Nie");
		}
		
		private function showIfPatientHasConstipation(...args):void 
		{
			trace("Nie");
		}
		
		private function showIfPatientVomited(...args):void 
		{
			trace("Tak");
		}
		
		private function showPainLength(...args):void 
		{
			trace("W tym miejscu od 2 godzin.");
			addOption("Czy lokalizacja bólu zmieniła się?", showIfPainLocationChanged, _interviewOptions);
			displayStartingOptions();
		}
		
		private function showIfPainLocationChanged(...args):void 
		{
			trace("Tak, rano ból był tutaj (pacjent wskazuje na nadbrzusze), a potem przemieścił się.");
		}
		
		
		private function showPainLocation(...args):void 
		{
			trace("O tutaj. (pacjent pokazuje na prawą strone brzucha na dole, tzw. prawy dól biodrowy");
		}
		
		private function makeExamination(examination:String):void 
		{
			trace("Wykonano badanie: " + examination);
		}
		
		
		
		
		
		private function giveDiagnosis(ailmentName:String):void 
		{
			trace("Zdiagnozowano: " + ailmentName);
		}
		
		private function displayExaminations(...args):void 
		{
			_options = _examinationOptions;
			displayStartingOptions();
		}
		
		private function displayInterview(...args):void 
		{
			_options = _interviewOptions;
			displayStartingOptions();
		}
		
		private function displayDefault(...args):void 
		{
			_options = _defaultOptions;
			displayStartingOptions();
		}
		private function displayDiagnosis(...args):void 
		{
			_options = _diagnosisOptions;
			displayStartingOptions();
		}
		
		public function whenClicked():void 
		{
			trace(" aaa ");
		}
		
		public function addOption(text:String, onClick:Function, list:Vector.<DialogOption>, ...args):void 
		{
			if (!list)	
			{
				trace("List is null");
				return;
			}
			list.push(new DialogOption(text, onClick, args));
		}
		
		public function displayOptions(from:int):void 
		{
			var next:Boolean, previous:Boolean;
			var to:int;
			var i:int = 0;

			if (_options.length < from)
			{
				trace("error - showing non existent option");
				return;
			}
			
			if (from  < 0)
				from = 0;
			
			if (from > 0)
				previous = true;
				
			if (from + optionsPerPage <= _options.length)
			{
				next = true;
				to = from + optionsPerPage - 1;
			}
			else
			{
				to = from + optionsPerPage;
			}
			
			if (previous)
				to--;
			if (_options.length < to)
			{
				to = _options.length;
			}
			
				
			var option:int = from;
			if (from > to || to < 0)
			{
				trace("wrong parameters");
				return;
			}
			
			_displayedFrom = from;
			_displayedTo = to;
			
			
			for (i = 0; i < optionsPerPage; ++i)
			{
				if (previous && 0 == i)
				{
					_displayedOptions[i].setOption(_lessOption);
				}
				else if(option < to)
				{
					_displayedOptions[i].setOption(_options[option++])
				}
				else if (next && option == to)
				{
					_displayedOptions[i].setOption(_moreOption);
				}
				else
				{
					_displayedOptions[i].setOption(null);
				}	
			}
		}
		
		private function displayMoreOption():void 
		{
			_displayedOptions.push(_moreOption);
		}
		
		private function displayLessOption():void 
		{
			_displayedOptions.push(_lessOption);
		}
		
		public function displayStartingOptions():void 
		{
			var allDisplayed:Boolean = _options.length < optionsPerPage;
			displayOptions(0);
		}
		
		public function showDisplayedOptions():void 
		{
			for each(var option:DisplayedOption in _displayedOptions)
			{
				addChild(option);
			}
		}
		
		public function hideDisplayedOptions():void 
		{
			for each(var option:DisplayedOption in _displayedOptions)
			{
				removeChild(option);
			}
		}
		
		public function showMore():void 
		{
			displayOptions(_displayedTo);
		}
		public function showLess():void 
		{
			displayOptions(_displayedFrom - optionsPerPage);
		}
		public static function get dialogBox():DialogBox 
		{
			return _dialogBox;
		}
		public static function set dialogBox(val:DialogBox):void 
		{
			if (_dialogBox)
			{
				_dialogBox.clear();
			}
			_dialogBox = val;
		}
		
		/*private var _defaultOptions:Vector.<DialogOption>;
		private var _examinationOptions:Vector.<DialogOption>;
		private var _diagnosisOptions:Vector.<DialogOption>;
		private var _interviewOptions:Vector.<DialogOption>;*/
		
		public function get interview():Vector.<DialogOption> 
		{
			return _interviewOptions;
		}
		
		override public function clear():void 
		{
			trace("Clearing dialogbox");
			_dialogBox = null;
			for each (var displayed:DisplayedOption in _displayedOptions) 
			{
				removeChild(displayed);
				displayed.clear();
			}
			super.clear();
		}
	}
}
import starling.display.Sprite;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.text.TextField;

class DisplayedOption extends Sprite
{
	private static var numOption:int;
	
	private var _id:int;
	private var _textField:TextField;
	private var _currentOption:DialogOption;
	
	public function DisplayedOption(fieldWidth:int, fieldHeight:int) 
	{
		_id = numOption++;
		this.y = _id * fieldHeight;
		_textField = new TextField(fieldWidth, fieldHeight, "");
		_textField.hAlign = "left";
		addChild(_textField);
		addEventListener(TouchEvent.TOUCH, onClickOption);
	}
	
	public function onClickOption(e:TouchEvent):void 
	{
		if(_currentOption)
			if (e)
			{
				var touch:Touch = e.getTouch(this);
				if(touch)
					if (touch.phase == TouchPhase.ENDED)
					{
						_currentOption.onClick.apply(this, _currentOption.args);
					}
			}
	}
	
	public function setOption(dOption:DialogOption):void 
	{
		_currentOption = dOption;
		if (_currentOption)
		{
			_textField.useHandCursor = true;
			_textField.text = (_id + 1  + ". " + _currentOption.text).toUpperCase();
		}
		else
		{
			_textField.text =  "";
			_textField.useHandCursor = false;

		}
	}
	
	public function clear():void 
	{
		removeEventListeners();
		removeChild(_textField);
		_textField.dispose();
		_textField = null;
	}
}
