package 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.events.Event;

	public class Main extends MovieClip
	{

		public static var carousel;
		public static var pathList:Array = new Array('pic1.jpg','pic2.jpg','pic3.jpg','pic4.jpg','pic5.jpg','pic6.jpg','pic7.jpg','pic8.jpg');
		public static var speed = 0;
		private var mouse_acc = 15000;
		public static var centerX = 0;
		public static var centerY = 0;
		public static var radiusX = 250;
		public static var radiusY = 80;
		private var fade = 1;
		private static var countLoadedImages = 0;
		private static var _stage;

		public function Main()
		{
			carousel = new Carousel();
			carousel.visible = false;
			this.addChild(carousel);
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
			carousel.x =  _stage.stageWidth/2
		}
		
		public static function duplicateDisplayObject(target:MovieClip):MovieClip {
			var targetClass:Class = Object(target).constructor;
			var duplicate:MovieClip = new targetClass();
			target.parent.addChild(duplicate);
			return duplicate;
		}

	}

}