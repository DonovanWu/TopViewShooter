package guns 
{
	/**
	 * ...
	 * @author Wenrui Wu
	 */
	public class M16 extends Gun {
		
		public function M16() {
			super({
				name : "Assault Rifle",
				mobility : 0.9,
				speed : 15,
				rpm : 750,
				burst : [0, 3],
				brpm : 750,
				damage : [33, 22],
				range : [420, 960],
				pellets: 1,
				mag_size : 30,
				max_clips : 3,
				spread : {hip : 7, aim : 2, prone : 1.5},
				kick : { hip : 5, aim : 3, prone : 2 }
			});
		}
		
	}

}