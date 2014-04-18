package core {
	/**
	 * ...
	 * @author Wenrui Wu
	 */
	
	import guns.AutoFireRifle;
	import misc.FlxGroupSprite;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	
	public class Player extends FlxGroupSprite {
		public var _ang:Number = 0;
		public var _movespeed:Number = Util.MOVE_SPEED;
		private var _mobility:Number;
		
		public var _body:FlxSprite = new FlxSprite();
		public var _hitbox:FlxSprite = new FlxSprite();
		
		public var _weapon:AutoFireRifle = new AutoFireRifle();
		
		public var _g:GameEngine;
		
		public function Player() {
			// origin of player's coordinate is at the center of body/hitbox
			_body.loadGraphic(Resource.IMPORT_PLAYER_BODY);
			this.add(_body);
			
			_hitbox.loadGraphic(Resource.IMPORT_HITBOX);
			_hitbox.alpha = 0.5;
			_hitbox.visible = false;
			this.add(_hitbox);
			
			
			this.add(_weapon);
			
			_movespeed = Util.MOVE_SPEED * _weapon.mobility();
		}
		
		public function update_player(game:GameEngine):void {
			_g = game;
			
			_hitbox.visible = _g.debug;
			
			_ang = Math.atan2(FlxG.mouse.y - _body.y, FlxG.mouse.x - _body.x);
			_body.angle = _ang * Util.DEGREE;
			_hitbox.angle = _ang * Util.DEGREE;
			
			_weapon.update_weapon(_g);
			
			update_position();
		}
		
		override public function update_position():void {
			_hitbox.set_position(x() - _hitbox.width / 2 ,y() -_hitbox.height / 2);
			_body.set_position(x() -_body.width / 2, y() -_body.height / 2);
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
	}

}