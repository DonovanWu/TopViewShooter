package guns 
{
	/**
	 * ...
	 * @author Wenrui Wu
	 */
	
	import org.flixel.FlxG;
	
	public class AssaultRifle extends BasicWeapon {
		private var _ct_rpm:Number = 0;
		
		public function AssaultRifle() {
			super(new GunStat());
		}
		
		override public function update_weapon():void {
			if (FlxG.mouse.pressed()) {
				// fire
			}
		}
	}

}