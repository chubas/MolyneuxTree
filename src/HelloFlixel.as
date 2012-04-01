package
{
	import org.flixel.*; //Allows you to refer to flixel objects in your code
	[SWF(width="640", height="480", backgroundColor="#000000")] //Set the size and color of the Flash file
	
	public class HelloFlixel extends FlxGame
	{
	
		public static const TILESIZE:int = 8;
		
		public function HelloFlixel()
		{
			forceDebugger = true;
			super(256, 208, PlayState, 2); //Create a new FlxGame object at 320x260 with 2x pixels, then load PlayState
		}
	}
}