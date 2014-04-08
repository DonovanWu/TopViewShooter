package guns 
{
	/**
	 * ...
	 * @author Wenrui Wu
	 */
	
	import org.flixel.FlxSprite;
	
	public class BasicWeapon extends FlxSprite{
		protected var _gunstat:GunStat;
		
		public function BasicWeapon(gunstat:GunStat) {
			this._gunstat = gunstat;
		}
		
		public function update_weapon():void { }
	}

}