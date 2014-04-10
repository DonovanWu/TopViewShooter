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
		public var _clip:int;
		
		private var _ammo_left:int;
		
		private var _ct_rpm:Number;
		private var _rpm:Number;
		
		public function AutoFireRifle() {
			// default gun data: _gunstat
			super(new GunStat());
			
			// initialize with one clip already loaded
			_ammo_left = _gunstat.ammo_total - _gunstat.mag_size;
			_rpm = 3600 / _gunstat.rpm;
			if (_rpm < 1) {
				_rpm = 1;
			}
			_ct_rpm = _rpm;
		}
		
		override public function update_weapon(game:GameEngine):void {
			if (FlxG.mouse.pressed()) {
				if (_ct_rpm >= _rpm) {
					var player_pos:FlxPoint = game._player.position();
					_ct_rpm -= _rpm;
					var ang:Number = game._player._ang * Util.DEGREE;
					
					var mx:Number = game._player._body.x;
					var my:Number = game._player._body.y;
					var muzzle_pos:FlxPoint = Util.calibrate_pos(mx, my, 20, 15, ang);
					
					var bullet:GunBullet = new GunBullet(muzzle_pos, ang, _gunstat.speed, _gunstat.damage, _gunstat.range);
					game._bullets.add(bullet);
				}
				_ct_rpm++;
			} else {
				_ct_rpm = _rpm;
			}
		}
	}

}