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
		public var _hitbox:FlxSprite = new FlxSprite();
		
		public var _debugbox:FlxSprite = new FlxSprite();
		
		public var _weapon:BasicWeapon = new BasicWeapon( { } );
		public var _wg:FlxSprite = new FlxSprite();	// weapon graphic
		
		public var _g:GameEngine;
		
		public function Player() {
			// origin of player's coordinate is at the center of hitbox
			_body.loadGraphic(Resource.IMPORT_PLAYER_BODY);
			this.add(_body);
			
			_hitbox.loadGraphic(Resource.IMPORT_HITBOX);
			_hitbox.alpha = 0.5;
			_hitbox.visible = false;
			this.add(_hitbox);
			
			this.add(_weapon);
			this.add(_wg);
			// _wg.visible = false;
			
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
			
			var weap_pos:FlxPoint = Util.calibrate_pos(x(), y(), 5, _weapon._offset.y, _ang);
			_ang = Math.atan2(FlxG.mouse.y - weap_pos.y, FlxG.mouse.x - weap_pos.x);
			_body.angle = _ang * Util.DEGREE;
			_hitbox.angle = _ang * Util.DEGREE;
			
			_weapon.update_weapon(_g, this);
			weapon_mapping();
			
			update_position();
		}
		
		override public function update_position():void {
			_hitbox.set_position(x() - _hitbox.width / 2 ,y() -_hitbox.height / 2);
			_body.set_position(x() -_body.width / 2, y() -_body.height / 2);
			
			var weap_pos:FlxPoint = Util.calibrate_pos(x(), y(), 5, _weapon._offset.y, _ang);
			if (true) {
				_debugbox.set_position(weap_pos.x, weap_pos.y);
			}
			weap_pos = Util.repos2ctr(_wg, weap_pos, _ang);
			_wg.set_position(weap_pos.x, weap_pos.y);
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