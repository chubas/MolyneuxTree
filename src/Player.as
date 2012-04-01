package
{
	import org.flixel.*;
	import org.osmf.metadata.ObjectFacet;
	
	public class Player extends FlxSprite
	{
		public var standingTimer:int;
		public var state:int;
		public var trees:Array;
		
		public static const STANDING_RIGHT:int = 0;
		public static const STANDING_LEFT:int  = 1;
		public static const FEEDING:int        = 2;
		public static const RUNNING_RIGHT:int  = 3;
		public static const RUNNING_LEFT:int   = 4;
		public static const JUMPING_RIGHT:int  = 5;
		public static const JUMPING_LEFT:int   = 6;
		public static const HURT_RIGHT:int     = 7;
		public static const HURT_LEFT:int      = 8;
		
		public static const STEP_OVER_TOLERANCE:int     = 6;
		public static const FRAMES_TO_START_FEEDING:int = 60;
		
		public static const WIDTH:int = 2 * HelloFlixel.TILESIZE;
		public static const HEIGHT:int = 3 * HelloFlixel.TILESIZE;
		
		public function Player(x:int, y:int)
		{
			super(x * HelloFlixel.TILESIZE, y * HelloFlixel.TILESIZE);
			
			this.makeGraphic(WIDTH, HEIGHT, 0xffff0000);
			
			this.maxVelocity.x = 150;
			this.maxVelocity.y = 300;
			this.acceleration.y = 300;
			this.drag.x = this.maxVelocity.x * 4;
			
			this.state = STANDING_RIGHT;
		}
		
		public function feedTrees():void {
			var tree:Tree;
			var i:int;
			if(this.acceleration.x == 0) {
				for(i = 0; i < trees.length; i++) {
					tree = trees[i];
					if(this.x >= tree.x - STEP_OVER_TOLERANCE && this.x <= tree.x + STEP_OVER_TOLERANCE) {
						if(this.standingTimer > FRAMES_TO_START_FEEDING) {
							tree.startFeeding();
							this.state = FEEDING;
						}
					} else {
						tree.stopFeeding();
					}
				}
			} else {
				for(i = 0; i < trees.length; i++) {
					tree = trees[i];
					tree.stopFeeding();
				}
			}
		}
		
		public function getHurt():void {
			state = facing == FlxObject.LEFT ? HURT_LEFT : HURT_RIGHT;
			this.makeGraphic(WIDTH, HEIGHT, 0xFF000000);
		}
		
		public override function update():void {

			super.update();
			//Player movement and controls
			
			this.acceleration.x = 0;
			
			this.standingTimer += 1;
			if(this.isTouching(FlxObject.FLOOR)) {
				if(FlxG.keys.LEFT) {
					this.acceleration.x = -this.maxVelocity.x*4;
					this.state = RUNNING_RIGHT;
					this.standingTimer = 0;
				}
				if(FlxG.keys.RIGHT) {
					this.acceleration.x = this.maxVelocity.x*4;
					this.state = RUNNING_LEFT;
					this.standingTimer = 0;
				}
				if(!FlxG.keys.LEFT && !FlxG.keys.RIGHT) {
					this.state = facing == FlxObject.LEFT ? STANDING_LEFT : STANDING_RIGHT;
				}
				if(FlxG.keys.justPressed("UP")) {
					this.standingTimer = 0;
					this.velocity.y = -this.maxVelocity.y/2;
				}
				this.feedTrees();
			} else {
				if(FlxG.keys.LEFT) {
					this.standingTimer = 0;
					this.acceleration.x = -this.maxVelocity.x*4;
					this.state = JUMPING_LEFT;
				}
				if(FlxG.keys.RIGHT) {
					this.standingTimer = 0;
					this.acceleration.x = this.maxVelocity.x*4;
					this.state = JUMPING_RIGHT;
				}
			}
			
			switch(this.state) {
				case STANDING_LEFT:
					this.makeGraphic(WIDTH, HEIGHT, 0xFFD13F79);
					break;
				case STANDING_RIGHT:
					this.makeGraphic(WIDTH, HEIGHT, 0xFFE30B62);
					break;
				case RUNNING_LEFT:
					this.makeGraphic(WIDTH, HEIGHT, 0xFF4162B0);
					break;
				case RUNNING_RIGHT:
					this.makeGraphic(WIDTH, HEIGHT, 0xFF0D348F);
					break;
				case JUMPING_LEFT:
					this.makeGraphic(WIDTH, HEIGHT, 0xFFB1CC02);
					break;
				case JUMPING_RIGHT:
					this.makeGraphic(WIDTH, HEIGHT, 0xFF94AB00);
					break;
				case FEEDING:
					this.makeGraphic(WIDTH, HEIGHT, 0xFF00FF00);
					break;
			}
			
		}
	}
}