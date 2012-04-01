// ActionScript file

package {
	import org.flixel.*;
	
	public class PlayState extends FlxState {
		public var player:Player;
		public var trees:Array;
		public var floor:FlxTileblock;
		public var dogEnemy:Enemy;
		
		public var leftWall:FlxTileblock;
		public var rightWall:FlxTileblock;
		
		public static const DOG_VELOCITY:int = 40;
		
		override public function create():void {
			//add(new FlxText(0,0,100,"Hello, World!")); //adds a 100px wide text field at position 0,0 (upper left)
			FlxG.bgColor = 0xffaaaaff;
			FlxG.debug = true;
						
			floor = new FlxTileblock(0, 13 * HelloFlixel.TILESIZE, 256, 208);
			floor.makeGraphic(256, HelloFlixel.TILESIZE, 0xff689c16);
			add(floor);
			
			// Invisible walls
			leftWall  = new FlxTileblock(-HelloFlixel.TILESIZE, 0, HelloFlixel.TILESIZE, 208);
			rightWall = new FlxTileblock(256, 0, HelloFlixel.TILESIZE, 208);
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
		}
		
		override public function update():void {

			player.update();			
			super.update();
			
			//Check if player collected a coin or coins this frame
			// FlxG.overlap(coins,player,getCoin);
			
			//Check to see if the player touched the exit door this frame
			// FlxG.overlap(exit,player,win);
			
			//Finally, bump the player up against the level
			
			FlxG.collide(floor, player);
			FlxG.collide(floor, dogEnemy);
			
			FlxG.collide(leftWall,  player);
			FlxG.collide(rightWall, player);
			FlxG.collide(leftWall,  dogEnemy, function():void { dogEnemy.velocity.x = DOG_VELOCITY;  } );
			FlxG.collide(rightWall, dogEnemy, function():void { dogEnemy.velocity.x = -DOG_VELOCITY; } );
		}
		
		public function addTree(xPosition:int): void {
			var tree:Tree = new Tree(xPosition, 14);
			add(tree);
			
			trees.push(tree);
		}
	}
}