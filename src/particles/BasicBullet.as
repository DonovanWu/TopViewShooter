package particles 
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author ...
	 */
	public class BasicBullet extends FlxSprite	{
		public var _dmg:Number;
		
		public function BasicBullet(x:Number, y:Number) {
			this.set_position(x, y);
			_dmg = 1;
		}
		
		public function update_bullet(game:GameEngine):void { }
		public function should_remove():Boolean { return true; }
		public function do_remove():void { }
	}

}