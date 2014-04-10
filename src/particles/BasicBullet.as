package particles 
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author ...
	 */
	public class BasicBullet extends FlxSprite	{
		public var _curr_dmg:Number;
		
		public function BasicBullet(x:Number = 0, y:Number = 0) {
			super(x, y);
			
			_curr_dmg = 1;
		}
		
		public function update_bullet(game:GameEngine):void { }
		public function should_remove():Boolean { return true; }
		public function do_remove():void { }
	}

}