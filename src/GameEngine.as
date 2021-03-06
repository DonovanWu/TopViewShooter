package {
	/**
	 * ...
	 * @author Wenrui Wu
	 */
	
	import flash.display.*;
	import gameobj.BasicBlock;
	import guns.*;
	import particles.BasicBullet;
	import particles.GunBullet;
	
	import core.Player;
	import misc.*;
	import org.flixel.*;
	// import org.flixel.plugin.photonstorm.*;
	import scenes.BasicLevel;
	import scenes.TestLevel;
	import guns.BasicWeapon;
	
	public class GameEngine extends FlxState {
		public var _level:BasicLevel;
		public var _bg:FlxSprite = new FlxSprite();
		public var _layout:FlxGroup = new FlxGroup();
		
		public var _bullets:FlxGroup = new FlxGroup();
		
		public var _player:Player = new Player();
		public var _is_moving:Boolean = false;
		public var _is_sprinting:Boolean = false;
		public var _stance:int = 0;	// 0 for hip, 1 for aim, -1 for prone
		
		public var _reticle:FlxSprite = new FlxSprite();
		public var _camera_icon:FlxSprite = new FlxSprite();
		public var _test_obj:FlxSprite = new FlxSprite();
		
		// game ui?
		public var _weapons:Array;
		public var _curr_weap:int = 0;
		
		public var debug:Boolean = false;
		
		public function GameEngine() {
			_level = new TestLevel();
		}
		
		override public function create():void {
			super.create();
			
			FlxG.worldBounds = new FlxRect(0, 0, _level.wid(), _level.hei());
			
			// bg
			_bg = _level._bg;
			this.add(_bg);
			
			this.add(_bullets);
			
			// game ui?
			_weapons = [new M16(), new SPAS12(), new AA12(), new QBZ95(), new FAL(), new M1216()];
			
			// mid - player, enemies
			_player.set_pos(Util.WID / 2, Util.HEI / 2);
			this.add(_player);
			
			// front - level layout
			_layout = _level._objs;
			this.add(_layout);
			
			// camera
			_camera_icon.loadGraphic(Resource.IMPORT_CAMERA_ICON);
			_camera_icon.visible = false;		// turn visible for debugging
			this.add(_camera_icon);
			
			FlxG.camera.follow(_camera_icon);
			var stgw:Number = FlxG.stage.stageWidth / 4; var stgh:Number = FlxG.stage.stageHeight / 4;
			FlxG.camera.setBounds(-stgw, -stgh, _level.wid() + stgw * 2, _level.hei() + stgh * 2);
			FlxG.camera.antialiasing = false;	// option to turn on and off?
			
			FlxG.mouse.show(Resource.IMPORT_MOUSE_RETICLE, 1, -13, -13);
			
			/*
			_test_obj.loadGraphic(Resource.IMPORT_PARTICLE_S);
			_test_obj.color = 0xff0000;
			_test_obj.visible = debug;
			this.add(_test_obj);
			*/
		}
		
		override public function update():void {
			super.update();
			
			update_bullets();
			
			_player.update_player(this);
			update_control();
			
			/*
			_camera_icon.set_position((_player.x() + FlxG.mouse.x - _camera_icon.width) / 2,
									(_player.y() + FlxG.mouse.y - _camera_icon.height) / 2);
			// problem: gun position will be considered "out of screen" and not be loaded at right-bottom corner
			/**/
			/**/
			_camera_icon.set_position((_player.x() + FlxG.mouse.x) / 2,
									(_player.y() + FlxG.mouse.y) / 2);
			/**/
		}
		
		private function update_bullets():void {
			for (var i:int = _bullets.members.length - 1; i >= 0; i--) {
				var itr_bullet:BasicBullet = _bullets.members[i];
				if (itr_bullet != null) {	// for some odd reason, things only work if this line is added
					itr_bullet.update_bullet(this);
					if (itr_bullet.should_remove()) {
						// remove case: max range reached; effect: simply disappear
						/**/
						itr_bullet.do_remove();
						_bullets.remove(itr_bullet, true);
						/**/
						// itr_bullet.kill();	// does this improve performance, or do i need to do something more?
					}
					
					if (Util.is_out_of_bound(itr_bullet, _level.get_bound())) {
						// remove case: out of bound
						// TODO: add hit animation
						itr_bullet.do_remove();
						_bullets.remove(itr_bullet, true);
					}
				} // end of if
			} // end of for
			
			FlxG.overlap(_layout, _bullets, function(obj:BasicBlock, bullet:BasicBullet):void {
				// remove case: hit static object
				// TODO: add hit animation
				if (obj._static) {
					itr_bullet.do_remove();
					_bullets.remove(itr_bullet, true);
				}
			});
		}
		
		private function update_control():void {
			var bound:FlxPoint = _level.get_bound();
			
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
				trace("switched to weapon: " + _weapons[_curr_weap].name());
			}
			
			if (Util.is_key(Util.SELECT_FIRE, true) && (_weapons[_curr_weap] is Gun)) {
				_weapons[_curr_weap].select_fire();
				trace("select fire");
			}
			
			if (Util.is_key(Util.RELOAD, true) && (_weapons[_curr_weap] is Gun)) {
				_weapons[_curr_weap].reload();
				trace("reload");
			}
		}
	}
	
}