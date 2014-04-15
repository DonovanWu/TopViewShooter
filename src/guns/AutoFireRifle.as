package guns 
{
	/**
	 * ...
	 * @author Wenrui Wu
	 */
	
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import particles.GunBullet;
	
	public class AutoFireRifle extends BasicWeapon {
		public var _CATEGORY:String;
		public var _name:String;
		
		public var _mag:int;
		private var _ammo_left:int;
		
		private var _ct_rpm:Number;
		private var _rpm:Number;
		
		public function AutoFireRifle() {
			// default gun data: _gunstat
			super(new GunStat());
			
			_CATEGORY = "AUTO_FIRE_RIFLE";
			_name = _gunstat.name;
			
			// initialize with one clip already loaded
			_ammo_left = _gunstat.ammo_total - _gunstat.mag_size;
			_mag = _gunstat.mag_size;
			_rpm = 3600 / _gunstat.rpm;
			if (_rpm < 1) {
				_rpm = 1;
			}
			_ct_rpm = _rpm;
		}
		
		override public function update_weapon(game:GameEngine):void {
			if (FlxG.mouse.pressed()) {
				if (_mag > 0) {
					if (_ct_rpm >= _rpm) {
						_ct_rpm -= _rpm;
						_mag--;
						
						var ang:Number = game._player._ang * Util.DEGREE;
						var player_pos:FlxPoint = game._player.position();
						var muzzle_pos:FlxPoint = Util.calibrate_pos(player_pos.x, player_pos.y, 10, 0, ang);
						
						var bullet:GunBullet = new GunBullet(muzzle_pos, ang, _gunstat.speed, _gunstat.damage, _gunstat.range);
						game._bullets.add(bullet);
					}
					_ct_rpm++;
				}
			} else {
				// capping the rpm
				if (_ct_rpm < _rpm) {
					_ct_rpm++;
				} else {
					_ct_rpm = _rpm;
				}
			}
			
			if (_mag <= 0) {
				// call change clip animation, pass this?
			}
		}
	}

}