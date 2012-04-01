package {
	
	import org.flixel.*;
	
	public class Tree extends FlxSprite {
		
		public var state:int; // Not used right now // 0: Standing, 1: Feeding
		public static const WIDTH:int = 2 * HelloFlixel.TILESIZE;
		public static const HEIGHT:int = 3 * HelloFlixel.TILESIZE;
		
		public function Tree(x:int, y:int): void {
			super(x * HelloFlixel.TILESIZE, y * HelloFlixel.TILESIZE);
			this.makeGraphic(WIDTH, HEIGHT, 0xff00ff00);
		}
		
		public function startFeeding():void {
			this.makeGraphic(WIDTH, HEIGHT, 0xff0000ff);
		}
		
		public function stopFeeding():void {
			this.makeGraphic(WIDTH, HEIGHT, 0xff00ff00);
		}
	}
}