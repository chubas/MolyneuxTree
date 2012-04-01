package {
	
	import org.flixel.*;
	
	public class Tree extends FlxSprite {
		
		[Embed(source="/assets/music/congaloop2.mp3")]
		public var FeedingSound:Class;
		
		public static const STANDING:int = 0;
		public static const FEEDING:int  = 1;
		
		public var Sound:FlxSound;
		
		public var state:int;
		
		public static const WIDTH:int = 2 * HelloFlixel.TILESIZE;
		public static const HEIGHT:int = 3 * HelloFlixel.TILESIZE;
		
		public function Tree(x:int, y:int): void {
			super(x * HelloFlixel.TILESIZE, y * HelloFlixel.TILESIZE);
			this.makeGraphic(WIDTH, HEIGHT, 0xff00ff00);
			this.state = STANDING;
			this.Sound = new FlxSound();
		}
		
		public function startFeeding():void {
			if(this.state == STANDING) {
				this.Sound = FlxG.play(FeedingSound, 1.0, true);
				this.Sound.fadeIn(3);
			}
			this.state = FEEDING;
			this.makeGraphic(WIDTH, HEIGHT, 0xff0000ff);
		}
		
		public function stopFeeding():void {
			//this.Sound.fadeOut(3);
			this.Sound.stop();
			this.state = STANDING;
			this.makeGraphic(WIDTH, HEIGHT, 0xff00ff00);
		}
	}
}