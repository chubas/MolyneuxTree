package {
	import org.flixel.FlxSprite;
	
	public class Enemy extends FlxSprite {
		public function Enemy(x:int, y:int) {
			super(x * HelloFlixel.TILESIZE, y * HelloFlixel.TILESIZE);
			this.makeGraphic(2 * HelloFlixel.TILESIZE, 2 * HelloFlixel.TILESIZE, 0xffF8FAED);
		}
	}
}