package guns 
{
	/**
	 * ...
	 * @author Wenrui Wu
	 */
	public class USAS12 extends Gun {
		
		public function USAS12() {
			super({
				name : "Shotgun",
				mobility : 1,
				speed : 12,
				rpm : 240,
				burst : [1],
				brpm : 240,
				damage : [20, 10],
				range : [300, 360],
				pellets: 8,
				mag_size : 8,
				max_clips : 3,
				spread : {hip : 6, aim : 3, prone : 3},
				kick : { hip : 3, aim : 2, prone : 2 }
			});
		}
		
	}

}