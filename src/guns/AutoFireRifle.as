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
		public const _CATEGORY:String = "AUTO_FIRE_RIFLE";
		
		public var _mag:int;
		public var _ammo:int;
		
		private var _ct_rpm:Number;
		private var _rpm:Number;
		
		public function AutoFireRifle() {
			// default gun data: _gunstat
			var my_gunstat:Object = new Object();
			my_gunstat = {
				name : "Assault Rifle",
				mobility : 0.9,
				speed : 15,
				rpm : 750,
				damage : [33, 22],
				range : [420, 960],
				mag_size : 300,
				max_clips : 3,
				spread : {hip : 7, aim : 2, prone : 1.5},
				kick : {hip : 5, aim : 3, prone : 2}
			}
			
			super(my_gunstat);
			
			_mag = _gunstat.mag_size;
			_ammo = _gunstat.max_clip * _mag;
			
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
						
						var ds:Number = 0.0;
						var dk:Number = 0.0;
						switch (game._stance) {
							case 0 : // hip
								ds = _gunstat.spread.hip;
								dk = _gunstat.kick.hip;
								break;
							case 1 : // aim
								ds = _gunstat.spread.aim;
								dk = _gunstat.kick.aim;
							case -1 : // prone
								ds = _gunstat.spread.prone;
								dk = _gunstat.kick.prone;
						}
						
						var ang:Number = game._player._ang * Util.DEGREE;
						ang = ang + Util.float_random(-ds, ds);
						var player_pos:FlxPoint = game._player.position();
						var kick:Number = Util.float_random( -dk, dk);
						var muzzle_pos:FlxPoint = Util.calibrate_pos(player_pos.x, player_pos.y, 10, kick, ang);
						
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
		
		override public function mobility():Number {
			return _gunstat.mobility;
		}
	}

}