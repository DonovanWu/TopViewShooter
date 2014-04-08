package scenes {
	/**
	 * ...
	 * @author Wenrui Wu
	 */
	
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	
	public class BasicLevel extends FlxGroup {
		protected var _g:GameEngine;
		protected var _dim_x:int;
		protected var _dim_y:int;
		protected var _total_wid:Number = 0;
		protected var _total_hei:Number = 0;
		
		private var _tile_count:int;
		private var expected_wid:int = 0;
		private var expected_hei:int = 0;
		
		// default: dim_x = dim_y = 1
		public function BasicLevel(game:GameEngine) {
			this._g = game;
			this._dim_x = 1;
			this._dim_y = 1;
			this._tile_count = 0;
		}
		
		public function set_dim(dim_x:int, dim_y:int):BasicLevel {
			_dim_x = dim_x;
			_dim_y = dim_y;
			return this;
		}
		
		protected function add_tile(tile:GameWorld):void {
			var old_wid:int = tile.wid();
			var old_hei:int = tile.hei();
			
			if (expected_wid != 0 && expected_hei != 0) {
				if (old_wid == expected_wid && old_hei == expected_hei && _tile_count <= _dim_x * _dim_y) {
					this.add(tile);
					_tile_count++;
				}
			} else {
				expected_wid = old_wid;
				expected_hei = old_hei;
				
				_total_wid = expected_wid * _dim_x;
				_total_hei = expected_hei * _dim_y;
				
				this.add(tile);
				_tile_count++;
			}
		}
		
		// return the total width and height as a flxpoint
		// if they're not given yet just return the stage width and height
		public function get_bound():FlxPoint {
			if (_total_wid != 0 && _total_hei != 0) {
				return new FlxPoint(_total_wid, _total_hei);
			} else {
				return new FlxPoint(Util.WID, Util.HEI);
			}
		}
	}
}