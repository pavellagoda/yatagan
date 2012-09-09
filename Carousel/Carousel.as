package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class Carousel extends MovieClip
	{
		private var itemList:Array = new Array();

		public function Carousel()
		{
			for (var i = 0; i< Main.pathList.length; i++) {
				var item = new Item(i);
				itemList.push(item);
				this.addChild(item);
			}
			this.initCarousel();
		}

		private function initCarousel()
		{
			this.addEventListener(Event.ENTER_FRAME, moveCarousel);
		}

		private function moveCarousel(evt)
		{
			for (var i = 0; i< itemList.length; i++) {
				var currMc = itemList[i];
				currMc.x = Math.cos(currMc.angle) * Main.radiusX;
				currMc.y = Math.sin(currMc.angle) * Main.radiusY + Main.centerY;
				var s:Number = currMc.y / (Main.centerY + Main.radiusY);

				currMc.scaleX = s * 1;
				currMc.scaleY = s * 1;
				
				currMc.angle +=  Main.speed;
			}
			var tmp:Array = itemList;
			tmp.sortOn('scaleX', Array.NUMERIC)
			
			for(var j = 0; j<tmp.length; j++) {
				this.setChildIndex(this.getChildByName(tmp[j].name), this.numChildren - 1)
			}
		}
	}

}