package scenes 
{
	/**
	 * ...
	 * @author Wenrui Wu
	 */
	
	import flash.display.*;
	import org.flixel.FlxPoint;
	
	public class TestLevel extends BasicLevel {
		
		public function TestLevel() {
			super({
				blocks: [
					{x1:50, y1:75, x2:100, y2:125},
					{x1:500, y1:500, x2:600, y2:600}
				]
			});
			_wid = 640 * 2;
			_hei = 640 * 2;
			_bg.loadGraphic(Resource.IMPORT_DEFAULT_BG);
			_bg.set_position(0, 0);
			_bg.width = _wid;
			_bg.height = _hei;
			this.add(_bg);
		}
		
	}

}