package guns 
{
	/**
	 * ...
	 * @author Wenrui Wu
	 */
	public class FAL extends Gun{
		
		public function FAL() {
			super({
				name : "Semi-auto Rifle",
				mobility : 0.9,
				speed : 15,
				rpm : 400,
				burst : [1, 0],
				brpm : 400,
				damage : [49, 35],
				range : [420, 960],
				pellets: 1,
				mag_size : 30,
				max_clips : 3,
				spread : {hip : 10, aim : 1, prone : 1},
				kick : { hip : 5, aim : 1.5, prone : 1 }
			});
		}
		
	}

}