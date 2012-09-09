package 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	public class Main extends MovieClip
	{

		public static var carousel;
		public static var pathList:Array = new Array(
													 {'url':'pic1.png', 'name' : 'Гидрофильтр - Искрогаситель (Ятаган «Safe Fire»)'},
													 {'url':'pic2.png', 'name' : 'Дымофильтр электростатический (Ятаган «Smoke»)'},
													 {'url':'pic3.png', 'name' : 'Дымофильтр автоматический (Ятаган «Smoke Automat»)'},
													 {'url':'pic4.png', 'name' : 'Воздухоочиститель автономный (Ятаган «Recycle»)'},
													 {'url':'pic5.png', 'name' : 'Воздухоочиститель вентиляционный (Ятаган «Out»)'},
													 {'url':'pic6.png', 'name' : 'Установка комплексной очистки (Ятаган «Complex»)'}
													 );
		public static var speed = 0;
		private var mouse_acc = 15000;
		public static var centerX = 0;
		public static var centerY = 0;
		public static var radiusX = 250;
		public static var radiusY = 60;
		private var fade = 1;
		private static var countLoadedImages = 0;
		private static var _stage;

		public function Main()
		{
			carousel = new Carousel();
			carousel.visible = false;
			this.addChild(carousel);
			trace(name_txt)
			this.addChild(name_txt);
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(MouseEvent.MOUSE_MOVE, calculateSpeed);
			stage.addEventListener(Event.RESIZE, onResize);
			_stage = stage;
		}

		private function calculateSpeed(evt)
		{
			speed = (this.mouseX - centerX) / mouse_acc;
		}

		public static function imageLoaded()
		{
			countLoadedImages++;
			if (countLoadedImages == pathList.length)
			{
				carousel.visible = true;
				onResize();
			}
		}

		private static function onResize(evt = null)
		{
			centerX = _stage.stageWidth/2;
			centerY = _stage.stageHeight/2;
			carousel.x =  _stage.stageWidth/2;
			name_txt.x = _stage.stageWidth/2 - name_txt.width/2;
			name_txt.y = centerY - 180;
		}
		
		public static function duplicateDisplayObject(target:MovieClip):MovieClip {
			var targetClass:Class = Object(target).constructor;
			var duplicate:MovieClip = new targetClass();
			target.parent.addChild(duplicate);
			return duplicate;
		}
		
		public static function showNote(text) {
			name_txt.text = text;
		}
		public static function hideNote() {
			name_txt.text = '';
		}

	}

}