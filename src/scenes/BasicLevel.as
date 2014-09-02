package scenes {
	/**
	 * ...
	 * @author Wenrui Wu
	 */
	
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	
	import gameobj.*;
	
	public class BasicLevel extends FlxGroup {
		protected var _g:GameEngine;
		protected var _wid:Number = 0;
		protected var _hei:Number = 0;
		
		public var _bg:FlxSprite = new FlxSprite();
		protected var _layout:Object;
		public var _objs:FlxGroup = new FlxGroup();
		
		// default: dim_x = dim_y = 1
		public function BasicLevel(layout:Object) {
			this._layout = layout;
			
			_bg.loadGraphic(layout.bg);
			_bg.set_position(0, 0);
			if (_layout.wid) {
				_wid = _layout.wid;
				_hei = _layout.hei;
			} else {
				// automatically assign wid and hei to fit with bg, if not specified
				_wid = _bg.width;
				_hei = _bg.height;
			}
			
			_objs = parseLayout(_layout);
			this.add(_objs);
		}
		
		public function get_layout():Object {
			return _layout;
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
		
		public static function parseLayout(layout:Object):FlxGroup {
			var objs:FlxGroup = new FlxGroup();
			
			// box
			if (layout.box != null) {
				var boxes:Array = layout.box;
				for (var i:int = 0; i < boxes.length; i++) {
					var box:Object = boxes[i];
					var spr:Box = new Box(box.x, box.y, box.ang);
					objs.add(spr);
				}
			}
			
			// ... and more
			
			return objs;
		}
		
		public function wid():Number {
			return _wid;
		}
		
		public function hei():Number {
			return _hei;
		}
	}
}