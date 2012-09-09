package 
{
	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.events.Event;

	public class Item extends MovieClip
	{

		private var i;
		public var angle = 0;

		public function Item(i)
		{
			this.i = i;
			this.angle = i*((Math.PI*2)/Main.pathList.length);
			var loader:Loader = new Loader();
			loader.load(new URLRequest('img/'+Main.pathList[i]));
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onImageLoad);
			this.buttonMode = true
		}

		private function onImageLoad(evt)
		{
			var loader = evt.target.loader;
			loader.x =  -  loader.width / 2;
			loader.y =  -  loader.height;
			this.addChild(loader);
			this.addShadow();
		}
		private function addShadow()
		{
			var duplicate:Loader = new Loader();
			duplicate.load(new URLRequest('img/'+Main.pathList[i]));
			duplicate.contentLoaderInfo.addEventListener(Event.COMPLETE, onDuplicateLoad);
		}
		private function onDuplicateLoad(evt)
		{
			var loader = evt.target.loader;
			loader.x =  -  loader.width / 2;
			loader.y = loader.height + 3;
			loader.scaleY = -1
			loader.alpha = 0.6
			loader.cacheAsBitmap = true;
			Main.imageLoaded();
			this.addChild(loader);
			
			var mask = new GradientMask();
			mask.cacheAsBitmap = true;
			this.addChild(mask)
			
			loader.mask = mask
		}
		
	}
}