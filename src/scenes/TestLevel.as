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
			super( {
				wid: 1280,
				hei: 1280,
				bg: Resource.IMPORT_DEFAULT_BG,
				
				box: [
					{x:500, y:500, ang: 0 },
					{x:150, y:150, ang: 45 },
					{x:750, y:750, ang: 45}
				]
			});
		}
	}

}