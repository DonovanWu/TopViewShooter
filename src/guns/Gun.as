package guns 
{
	/**
	 * ...
	 * @author Wenrui Wu
	 */
	
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import particles.GunBullet;
	
	public class Gun extends BasicWeapon {
		public var _mag:int;
		public var _ammo:int;
		
		private var _ct_rpm:Number;
		private var _ct_brpm:Number;
		private var _rpm:Number;
		private var _brpm:Number;
		private var _burst:int;		// 0 for auto
		private var _ct_burst:int;
		
		public function Gun(stat:Object) {
			/* Sample stat:
			{
				name : "Assault Rifle",
				mobility : 0.9,
				speed : 15,
				rpm : 750,
				burst : [0, 3],
				brpm : 750,
				damage : [33, 22],
				range : [420, 960],
				pellets: 1,
				mag_size : 300,
				max_clips : 3,
				spread : {hip : 7, aim : 2, prone : 1.5},
				kick : { hip : 5, aim : 3, prone : 2 }
			} 
			*/
			
			super(stat);
			
			this._burst = _stat.burst[0];
			
			this._mag = _stat.mag_size;
			this._ammo = _stat.max_clip * _mag;
			
			this._rpm = 3600 / _stat.rpm;
			if (_rpm < 1) {
				_rpm = 1;
			}
			this._brpm = 3600 / _stat.brpm;
			if (_brpm < 1) {
				_brpm = 1;
			}
			_ct_rpm = _rpm;
			_ct_brpm = _brpm;
			
			_offset = _offset.make(10, 5);
			_ct_burst = 0;
		}
		
		override public function update_weapon(game:GameEngine):void {
			if (triggered()) {
				// if (_burst != 0 && _ct_brpm >= _brpm) _ct_brpm -= _brpm;
				
				if (_mag > 0) {
					if (_ct_rpm >= _rpm) {
						_ct_rpm -= _rpm;
						_mag--;
						// if (_burst != 0) _ct_burst++;
						
						var ds:Number = 0.0;
						var dk:Number = 0.0;
						switch (game._stance) {
							case 0 : // hip
								ds = _stat.spread.hip;
								dk = _stat.kick.hip;
								break;
							case 1 : // aim
								ds = _stat.spread.aim;
								dk = _stat.kick.aim;
							case -1 : // prone
								ds = _stat.spread.prone;
								dk = _stat.kick.prone;
						}
						
						for (var i:int = 1; i <= _stat.pellets; i++) {
							var ang:Number = game._player._ang * Util.DEGREE;
							ang = ang + Util.float_random(-ds, ds);
							var player_pos:FlxPoint = game._player.position();
							var kick:Number = Util.float_random( -dk, dk);
							var muzzle_pos:FlxPoint = Util.calibrate_pos(player_pos.x, player_pos.y, 10, kick, ang);
							
							var bullet:GunBullet = 
								new GunBullet(muzzle_pos, ang, _stat.speed, _stat.damage, _stat.range);
							game._bullets.add(bullet);
						}
					}
					_ct_rpm++;
				} // end if mag > 0
			} else {
				// capping the rpm
				if (_ct_rpm < _rpm) {
					_ct_rpm++;
				} else {
					_ct_rpm = _rpm;
				}
			}
			
			if (_burst != 0 && _ct_brpm < _brpm) _ct_brpm++;
			
			if (_ct_burst >= Math.abs(_burst) && _ct_brpm >= _brpm) {
				_ct_burst = 0;
			}
			
			if (_mag <= 0) {
				// call change clip animation, pass this?
			}
		}
		
		override public function mobility():Number {
			return _stat.mobility;
		}
		
		// differentiates types of triggering
		private function triggered():Boolean {
			if (_burst == 0) {
				return FlxG.mouse.pressed();
			} else if (_burst < 0) {
				// to implement interruptible burst, set _burst < 0
				return FlxG.mouse.pressed(); // && _ct_burst <= Math.abs(_burst);
			} else {
				return FlxG.mouse.justPressed(); // || (_ct_burst > 0 && _ct_burst <= Math.abs(_burst));
			}
		}
		
		public function select_fire():void {
			return;
		}
		
		public function set_ammo(ammo:int):void {
			if (ammo < 0 || ammo > _stat.max_clips * _stat.mag_size) {
				ammo = 0;
			}
			this._ammo = ammo;
		}
	}

}