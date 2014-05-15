package particles 
{
	import org.flixel.FlxPoint;
	
	public class GunBullet extends BasicBullet {	
		public var _speed:Number;
		public var _distance:Number;
		private var _damage:Array;
		private var _range:Array;
		

		public function GunBullet(pos:FlxPoint, ang:Number, spd:Number, dmg:Array, rg:Array) {
			// default: damage = 0
			super(pos.x, pos.y);

			this._speed = spd;
			rotate(ang);
			this._distance = 0;
			this._range = rg;
			this._damage = dmg;

			this.loadGraphic(Resource.IMPORT_GUN_BULLET);
		}
		
		private function curr_dmg_index():int {
			for (var i:int = 0; i < _range.length; i++ ) {
				if (_distance <= _range[i]) {
					return i;
				}
			}
			return _range.length - 1;
		}
		
		private function rotate(ang:Number):void {
			this.angle = ang;
			this.x -= 15 * (1 - Math.cos(ang * Util.RADIAN));
			this.y += 15 * Math.sin(ang * Util.RADIAN);
		}
		
		override public function update_bullet(game:GameEngine):void {
			this.x += _speed * Math.cos(this.angle * Util.RADIAN);
			this.y += _speed * Math.sin(this.angle * Util.RADIAN);
			_distance += _speed;
			
			_dmg = _damage[curr_dmg_index()];
		}
		
		override public function should_remove():Boolean {
			return _distance >= _range[_range.length - 1];
		}
	}
}