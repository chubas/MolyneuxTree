package
{
	import org.flixel.FlxSprite;
	
	public class Enemy extends FlxSprite
	{
		public function Enemy(x:int, y:int);
		{
			super(X, Y, SimpleGraphic);
			this.makeGraphic(16, 16);
		}
	}
}