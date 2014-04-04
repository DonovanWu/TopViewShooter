package core {
	/**
	 * ...
	 * @author Wenrui Wu
	 */
	
	import misc.FlxGroupSprite;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	
	public class Player extends FlxGroupSprite {
		public var _ang:Number = 0;
		public var _movespeed:Number = Util.MOVE_SPEED;
		
		public var _body:FlxSprite = new FlxSprite();
		
		public var _g:GameEngine;
		
		public function Player() {
			_body.loadGraphic(Resource.IMPORT_PLAYER_BODY);
			this.add(_body);
		}
		
		public function update_player(game:GameEngine):void {
			_g = game;
			
			_ang = Math.atan2(FlxG.mouse.y - _body.y, FlxG.mouse.x - _body.x);
			_body.angle = Util.r2d(_ang);
			
			update_position();
		}
		
		override public function update_position():void {
			_body.set_position(x(), y());
		}
		
		public function sprint():void {
			_movespeed = Util.SPRINT_SPEED * _g._mobility;
		}
		
		public function restore_movespeed():void {
			_movespeed = Util.MOVE_SPEED * _g._mobility;
		}
	}

}