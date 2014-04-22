package scenes {
	/**
	 * ...
	 * @author Wenrui Wu
	 */
	
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	
	public class BasicLevel extends FlxGroup {
		protected var _g:GameEngine;
		protected var _wid:Number = 0;
		protected var _hei:Number = 0;
		
		protected var _bg:FlxSprite = new FlxSprite();
		protected var _layout:Object;
		
		// default: dim_x = dim_y = 1
		public function BasicLevel(layout:Object) {
			this._layout = layout;
		}
		
		// return the total width and height as a flxpoint
		// if they're not given yet just return the stage width and height
		public function get_bound():FlxPoint {
			if (_wid != 0 && _hei != 0) {
				return new FlxPoint(_wid, _hei);
			} else {
				return new FlxPoint(Util.WID, Util.HEI);
			}
		}
	}
}