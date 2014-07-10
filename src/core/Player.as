package core {
	/**
	 * ...
	 * @author Wenrui Wu
	 */
	
	import guns.*;
	import misc.FlxGroupSprite;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	
	/*
	 * TODO:
		 * try separate bullet emitter from gun, and add gun graphic directly to player
		 * doing: weapon mapping
	 */
	
	public class Player extends FlxGroupSprite {
		public var _ang:Number = 0;		// radian
		public var _movespeed:Number = Util.MOVE_SPEED;
		private var _mobility:Number;
		
		public var _body:FlxSprite = new FlxSprite();
		public var _limbs:FlxSprite = new FlxSprite();
		public var _hitbox:FlxSprite = new FlxSprite();
		public var _weap_pos:FlxPoint = new FlxPoint();
		public var _weap_off:FlxPoint = new FlxPoint();
		
		public var _debugbox:FlxSprite = new FlxSprite();
		
		public var _weapon:BasicWeapon = new BasicWeapon( { } );
		public var _wg:FlxSprite = new FlxSprite();	// weapon graphic
		
		public var _g:GameEngine;
		
		public function Player() {
			// layer (bottom -> top) : limbs, weapon, body
			_limbs.loadGraphic(Resource.IMPORT_PLAYER_LIMBS);
			// _limbs.origin.x = _limbs.origin.y = 15;
			this.add(_limbs);
			
			this.add(_weapon);
			this.add(_wg);
			// _wg.visible = false;
			
			// origin of player's coordinate is at the center of hitbox
			_body.loadGraphic(Resource.IMPORT_PLAYER_BODY);
			this.add(_body);
			_limbs.origin.x = _body.width / 2;
			_limbs.origin.y = _body.height / 2;
			
			_hitbox.loadGraphic(Resource.IMPORT_HITBOX);
			_hitbox.alpha = 0.5;
			_hitbox.visible = false;
			this.add(_hitbox);
			
			_movespeed = Util.MOVE_SPEED * _weapon.mobility();
			
			// debug box
			_debugbox.loadGraphic(Resource.IMPORT_PARTICLE_S);
			_debugbox.color = 0xff0000;
			_debugbox.set_position( -1000, -1000);
			this.add(_debugbox);
		}
		
		public function update_player(game:GameEngine):void {
			_g = game;
			
			_hitbox.visible = _g.debug;
			
			_weapon = _g._weapons[_g._curr_weap];
			_weap_off = _weap_off.make(_weapon._offset.x - _wg.width, _weapon._offset.y);
			
			_weapon.update_weapon(_g, this);
			weapon_mapping();
			
			update_position();
		}
		
		override public function update_position():void {
			// update position
			_hitbox.set_position(x() - _hitbox.width / 2 ,y() -_hitbox.height / 2);
			_body.set_position(x() -_body.width / 2, y() -_body.height / 2);
			_limbs.set_position(_body.x, _body.y);
			_weap_pos = Util.calibrate_pos(x(), y(), _weap_off.x, _weap_off.y, _ang);
			
			// update angle
			// _weap_pos = Util.calibrate_pos(x(), y(), 0, _weapon._offset.y, _ang);
			var dy:Number = FlxG.mouse.y - _weap_pos.y;
			var dx:Number = FlxG.mouse.x - _weap_pos.x;
			if (Math.abs(dy) < Math.abs(_weap_off.y) || Math.abs(dx) < Math.abs(_weap_off.x)) {
				// trace("spin prevention");
				dy = FlxG.mouse.y - y();
				dx = FlxG.mouse.x - x();
			}
			_ang = Math.atan2(dy, dx);
			_body.angle = _ang * Util.DEGREE;
			_hitbox.angle = _ang * Util.DEGREE;
			_limbs.angle = _ang * Util.DEGREE;
			
			if (_g != null && _g.debug) {
				_debugbox.set_position(_weap_pos.x, _weap_pos.y);
			}
			var wg_pos:FlxPoint = Util.repos2ctr(_wg, _weap_pos, _ang);
			_wg.set_position(wg_pos.x, wg_pos.y);
			_wg.angle = _ang * Util.DEGREE;
		}
		
		public function sprint():void {
			_movespeed = Util.SPRINT_SPEED * _weapon.mobility();
		}
		
		public function restore_movespeed():void {
			_movespeed = Util.MOVE_SPEED * _weapon.mobility();
		}
		
		public function position():FlxPoint {
			return new FlxPoint(x(), y());
		}
		
		private function weapon_mapping():void {
			var name:String = _weapon.name();
			switch(name) {
				case "M16":
					_wg.loadGraphic(Resource.IMPORT_WEAPON_M16);
					break;
				case "AA12":
					_wg.loadGraphic(Resource.IMPORT_WEAPON_AA12);
					break;
				default:
					_wg.loadGraphic(Resource.IMPORT_WEAPON_M16);
					break;
			}
			_wg.setOriginToCorner();
		}
	}

}