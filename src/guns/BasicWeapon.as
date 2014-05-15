package guns 
{
	/**
	 * ...
	 * @author Wenrui Wu
	 */
	
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	
	public class BasicWeapon extends FlxSprite{
		protected var _stat:Object;
		public var _offset:FlxPoint = new FlxPoint();
		
		public function BasicWeapon(stat:Object) {
			this._stat = stat;
		}
		
		public function name():String {
			return _stat.name;
		}
		
		public function mobility():Number {
			return _stat.mobility;
		}
		
		public function update_weapon(game:GameEngine):void { }
	}

}