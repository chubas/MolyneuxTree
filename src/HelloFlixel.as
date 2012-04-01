package
{
	import org.flixel.*; //Allows you to refer to flixel objects in your code
	
	[SWF(width="1000", height="1000", backgroundColor="#000000")] //Set the size and color of the Flash file
	
	public class HelloFlixel extends FlxGame
	{
	
		public static const WINDOW_WIDTH:int  = 52;
		public static const WINDOW_HEIGHT:int = 26;
		public static const TILESIZE:int      = 8;
		
		public function HelloFlixel()
		{
			forceDebugger = true;
			super(WINDOW_WIDTH * TILESIZE, WINDOW_HEIGHT * TILESIZE, PlayState, 2);
		}
	}
}