// ActionScript file

package {
	import flashx.textLayout.formats.BackgroundColor;
	
	import org.flixel.*;

	public class PlayState extends FlxState {
		
		[Embed(source="/assets/music/DeliberateThoughtConverted.mp3")]
		public var BGMusic:Class;
		
		[Embed(source="/assets/images/bkg_mountains_front.png")]
		public var BGImageMountainsFront:Class;
		
		[Embed(source="/assets/images/bkg_mountains_back.png")]
		public var BGImageMountainsBack:Class;
		
		public var bgMountainsFront:FlxSprite;
		public var bgMountainsBack:FlxSprite;
		public var bgDarkness:FlxSprite;
		
		public var player:Player;
		public var trees:Array;
		public var floor:FlxTileblock;
		public var dogEnemy:Enemy;
		
		public var leftWall:FlxTileblock;
		public var rightWall:FlxTileblock;
		
		public static const DOG_VELOCITY:int = 40;
		
		override public function create():void {
			FlxG.bgColor = 0xffaaaaff;
			
			bgMountainsBack = new FlxSprite(0, 0, BGImageMountainsBack);
			add(bgMountainsBack);

			bgDarkness = new FlxSprite(0, 0);
			bgDarkness.makeGraphic(FlxG.width, FlxG.height, 0x88000000);
			bgDarkness.blend = "multiply";
			add(bgDarkness);
			
			bgMountainsFront = new FlxSprite(0, 0, BGImageMountainsFront);
			add(bgMountainsFront);
			
			FlxG.debug = true;
						
			floor = new FlxTileblock(
				0,
				Math.ceil(HelloFlixel.WINDOW_HEIGHT / 2) * HelloFlixel.TILESIZE,
				HelloFlixel.WINDOW_WIDTH * HelloFlixel.TILESIZE,
				HelloFlixel.TILESIZE
			);
			floor.makeGraphic(HelloFlixel.WINDOW_WIDTH * HelloFlixel.TILESIZE, HelloFlixel.TILESIZE, 0xff689c16);
			add(floor);
			
			// Invisible walls
			leftWall  = new FlxTileblock(-HelloFlixel.TILESIZE, 0, HelloFlixel.TILESIZE, HelloFlixel.WINDOW_HEIGHT * HelloFlixel.TILESIZE);
			rightWall = new FlxTileblock(HelloFlixel.WINDOW_WIDTH * HelloFlixel.TILESIZE, 0, HelloFlixel.TILESIZE, HelloFlixel.WINDOW_HEIGHT * HelloFlixel.TILESIZE);
			add(leftWall);
			add(rightWall);
			
			trees = new Array();
			addTree(5);
			addTree(8);
			addTree(12);
			
			player = new Player(5, 10);
			player.trees = trees;
			add(player);
			
			dogEnemy = new Enemy(20, 11);
			dogEnemy.velocity.x = DOG_VELOCITY;
			add(dogEnemy);
			
			FlxG.playMusic(BGMusic);
		}
		
		override public function update():void {

			player.update();			
			super.update();
			
			FlxG.collide(floor, player);
			FlxG.collide(floor, dogEnemy);
			
			FlxG.collide(leftWall,  player);
			FlxG.collide(rightWall, player);
			FlxG.collide(leftWall,  dogEnemy, function():void { dogEnemy.velocity.x = DOG_VELOCITY;  } );
			FlxG.collide(rightWall, dogEnemy, function():void { dogEnemy.velocity.x = -DOG_VELOCITY; } );
			
			FlxG.overlap(player, dogEnemy, function():void { player.getHurt() } )
		}
		
		public function addTree(xPosition:int): void {
			var tree:Tree = new Tree(xPosition, 14);
			add(tree);
			
			trees.push(tree);
		}
	}
}