package gameobj 
{
	/**
	 * ...
	 * @author Wenrui Wu
	 */
	public class Box extends BasicBlock
	{
		
		public function Box(x:Number = 0, y:Number = 0, ang:Number = 0) 
		{
			super(x, y);
			this.angle = ang;
			this.loadGraphic(Resource.IMPORT_OBJ_BOX);
			// this.setOriginToCorner();
			// this.set_position(x - spr.width / 2, y - spr.height / 2);
		}
		
	}

}