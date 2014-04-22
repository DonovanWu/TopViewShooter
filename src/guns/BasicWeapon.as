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
		public var _offset:FlxPoint;
		
		public function BasicWeapon(stat:Object) {
			this._stat = stat;
			this._offset = new FlxPoint();
		}
		
		public function mobility():Number {
			return 1.0;
		}
		
		public function update_weapon(game:GameEngine):void { }
	}

}