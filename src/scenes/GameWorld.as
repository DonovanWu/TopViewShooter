package scenes 
{
	/**
	 * ...
	 * @author Wenrui Wu
	 */
	
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	
	public class GameWorld extends FlxGroup {
		private var width:Number;
		private var height:Number;
		
		public var _objects:FlxGroup = new FlxGroup();
		
		public function GameWorld(offset:FlxPoint, json:Array) {
			if (json.length == 0) {
				width = Util.WID;
				height = Util.HEI;
				var bg:FlxSprite = new FlxSprite();
				bg.width = width;
				bg.height = height;
				bg.loadGraphic(Resource.IMPORT_DEFAULT_BG);
				bg.set_position(offset.x, offset.y);
				this.add(bg);
			}
		}
		
		public function wid():int {
			return width;
		}
		
		public function hei():int {
			return height;
		}
	}

}