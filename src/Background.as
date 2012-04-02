package  
{
	import flash.display.Graphics;
	
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Pablo Arias
	 */
	public class Background extends FlxSprite {
		
		public static const Main:Class = HelloFlixel;
		
		public function Background(x:int = 0, y:int = 0):void {
			super(x * Main.TILESIZE, y * Main.TILESIZE);
		}		
	}
	
}
