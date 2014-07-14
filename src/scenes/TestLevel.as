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
				bg: "default_bg.jpg",
				
				box: [
					{x:500, y:500, scale:1, ang: 0 },
					{x:750, y:750, ang: 45}
				]
			});
		}
	}

}