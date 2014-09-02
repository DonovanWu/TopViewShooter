package gameobj 
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Wenrui Wu
	 */
	public class BasicBlock extends FlxSprite
	{
		
		public function BasicBlock(x:Number = 0, y:Number = 0) {
			super(x, y);
		}
		
		public var _static:Boolean;
	}

}