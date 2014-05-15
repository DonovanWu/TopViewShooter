package guns 
{
	/**
	 * ...
	 * @author Wenrui Wu
	 */
	public class QBZ95 extends Gun {
		
		public function QBZ95() {
			super({
				name : "Burst Rifle",
				mobility : 0.9,
				speed : 15,
				rpm : 1000,
				burst : [-3, 0],
				brpm : 160,
				damage : [33, 22],
				range : [420, 960],
				pellets: 1,
				mag_size : 30,
				max_clips : 3,
				spread : {hip : 10, aim : 1, prone : 1},
				kick : { hip : 5, aim : 1.5, prone : 1 },
				ads_mvspd : 0.5
			});
			
			this.loadGraphic(Resource.IMPORT_WEAPON_M16);
		}
		
	}

}