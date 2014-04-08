package particles 
{
	import org.flixel.FlxPoint;
	
	public class GunBullet extends BasicBullet {
		public var _speed:Number;
		public var _angle:Number;
		public var _distance:Number;
		private var _damage:Array;
		private var _range:Array;
		
		public function GunBullet(x:Number, y:Number, ang:Number, dmg:Array, rg:Array) {
			// default: damage = 0
			super(x, y);
			
			this._speed = 10;
			this._angle = ang;
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
		
		override public function bullet_update(game:GameEngine):void {
			this.x += _speed * Math.cos(_angle * Util.RADIAN);
			this.y += _speed * Math.sin(_angle * Util.RADIAN);
			_distance += _speed;
			
			_curr_dmg = _damage[curr_dmg_index()];
		}
		
		override public function should_remove():Boolean {
			return _distance >= _range[_range.length - 1];
		}
	}
}