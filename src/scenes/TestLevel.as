package scenes 
{
	/**
	 * ...
	 * @author Wenrui Wu
	 */
	
	import flash.display.*;
	import org.flixel.FlxPoint;
	
	public class TestLevel extends BasicLevel {
		
		public function TestLevel(game:GameEngine) {
			super(game);
			this.set_dim(2, 2);
			
			this.add_tile(new GameWorld(new FlxPoint(), []));
			this.add_tile(new GameWorld(new FlxPoint(640, 0), []));
			this.add_tile(new GameWorld(new FlxPoint(0, 640), []));
			this.add_tile(new GameWorld(new FlxPoint(640, 640), []));
			
			
		}
		
	}

}