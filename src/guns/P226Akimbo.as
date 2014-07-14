package guns 
{
	import org.flixel.FlxPoint;
	/**
	 * ...
	 * @author Wenrui Wu
	 */
	public class P226Akimbo extends Gun {
		public var _left:Boolean = true;
		
		public function P226Akimbo() {
			super( {
				name: "P226Akimbo",
				display_name : "Dual Wield Handgun",
				mobility : 1,
				speed : 12,
				rpm : 1000,
				burst : [1],
				damage : [40, 15],
				range : [300, 960],
				pellets: 8,
				mag_size : 28,
				max_clips : 2,
				spread : {hip : 5, aim : 5, prone : 3},
				kick : { hip : 2, aim : 2, prone : 1},
				ads_mvspd : 1
			});
		}
		
		override protected function spawn_bullet(muzzle_pos:FlxPoint, ds:Number, dk:Number):void {
			var off:FlxPoint = new FlxPoint().copyFrom(_offset);
			if (!_left) {
				off = _offset.make(_offset.x, - _offset.y);
			}
			
			if (_g != null) {
				if (_g._stance == 1) {
					// TODO: unusual aiming mechanics
					super.spawn_bullet(off, ds, dk);
				} else {
					// hip or prone: same direction
					super.spawn_bullet(off, ds, dk);
				}
			}
			
			_left = !_left;
		}
		
		override protected function make_offset():void {
			// default offset, suits for AR, SMG, LMG, DMR, SR, SG, do not override if using default
			_offset = _offset.make(0, -12);
		}
	}

}