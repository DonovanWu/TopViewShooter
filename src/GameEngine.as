package {
	/**
	 * ...
	 * @author Wenrui Wu
	 */
	
	import flash.display.*;
	import guns.*;
	import particles.BasicBullet;
	
	import core.Player;
	import misc.FlxGroupSprite;
	import org.flixel.*;
	import scenes.BasicLevel;
	import scenes.TestLevel;
	import guns.BasicWeapon;
	
	public class GameEngine extends FlxState {
		public var _levels:FlxGroup = new FlxGroup();
		public var _bullets:FlxGroup = new FlxGroup();
		
		public var _player:Player = new Player();
		public var _is_moving:Boolean = false;
		public var _is_sprinting:Boolean = false;
		public var _stance:int = 0;	// 0 for hip, 1 for aim, -1 for prone
		
		public var _camera_icon:FlxSprite = new FlxSprite();
		
		// game ui?
		public var _weapons:Array;
		public var _curr_weap:int = 0;
		
		public var debug:Boolean = false;
		
		override public function create():void {
			super.create();
			
			_levels.add(new TestLevel(this));
			this.add(_levels);
			
			this.add(_bullets);
			
			// game ui?
			_weapons = [new M16(), new USAS12(), new AA12()];
			
			// front
			_player.set_pos(Util.WID / 2, Util.HEI / 2);
			this.add(_player);
			
			_camera_icon.loadGraphic(Resource.IMPORT_CAMERA_ICON);
			_camera_icon.visible = false;		// turn visible for debugging
			this.add(_camera_icon);
			
			FlxG.camera.follow(_camera_icon);
			FlxG.camera.antialiasing = true;	// turn off for more fluent gameplay?
			
			FlxG.mouse.show(Resource.IMPORT_MOUSE_RETICLE, 1, -13, -13);
		}
		
		override public function update():void {
			super.update();
			
			update_bullets();
			
			_player.update_player(this);
			update_control();
			
			_camera_icon.set_position((_player.x() + FlxG.mouse.x) / 2, (_player.y() + FlxG.mouse.y) / 2);
		}
		
		private function update_bullets():void {
			for (var i:int = _bullets.members.length - 1; i >= 0; i--) {
				var itr_bullet:BasicBullet = _bullets.members[i];
				if (itr_bullet != null) {	// for some odd reason, things only work if this line is added
					itr_bullet.update_bullet(this);
				
					if (itr_bullet.should_remove()) {
						itr_bullet.do_remove();
						_bullets.remove(itr_bullet, true);
					}
				}
			}
		}
		
		private function update_control():void {
			var bound:FlxPoint = current_level().get_bound();
			
			_is_moving = false;
			_is_sprinting = false;
			
			if (Util.is_key(Util.MOVE_LEFT) && _player.x() > 0) {
				_player.x(-_player._movespeed);
				_is_moving = true;
				
			} else if (Util.is_key(Util.MOVE_RIGHT) && _player.x() < bound.x) {
				_player.x(_player._movespeed);
				_is_moving = true;
			} 
			
			if (Util.is_key(Util.MOVE_UP) && _player.y() > 0) {
				_player.y(-_player._movespeed);
				_is_moving = true;
				
			} else if (Util.is_key(Util.MOVE_DOWN) && _player.y() < bound.y) {
				_player.y(_player._movespeed);
				_is_moving = true;
			}
			
			if (Util.is_key(Util.MOVE_SPRINT)) {
				_player.sprint();
				_is_sprinting = true;
				_stance = 0;
			} else {
				_player.restore_movespeed();
				_is_sprinting = false;
			}
			
			if (Util.is_key(Util.TOGGLE_AIM, true)) {
				if (_stance != 1) {
					_stance = 1;	// aim
					trace("changed stance to aim");
				} else {
					_stance = 0;	// hip
					trace("changed stance to hip");
				}
			}
			
			if (Util.is_key(Util.WEAPON_SWITCH, true)) {
				_curr_weap = Util.key_index(Util.WEAPON_SWITCH);
				if (_curr_weap > _weapons.length - 1 || _curr_weap < 0) {
					_curr_weap = 0;
				}
				_stance = 0;
				trace("switched to weapon" + _curr_weap);
			}
		}
		
		private function current_level():BasicLevel {
			return _levels.members[0];
		}
	}
	
}