package guns 
{
	/**
	 * ...
	 * @author Wenrui Wu
	 */
	
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	
	public class BasicWeapon extends FlxSprite{
		protected var _gunstat:Object;
		
		public function BasicWeapon(gunstat:Object) {
			this._gunstat = gunstat;
		}
		
		public function mobility():Number {
			return 1.0;
		}
		
		public function update_weapon(game:GameEngine):void { }
	}

}