package guns 
{
	/**
	 * ...
	 * @author Wenrui Wu
	 */
	public class AA12 extends Gun {
		
		public function AA12() {
			super( {
				name : "AA12",
				display_name : "Full-auto Shotgun",
				mobility : 1,
				speed : 10,
				rpm : 300,
				burst : [0],
				damage : [15, 5],
				range : [240, 280],
				pellets: 8,
				mag_size : 8,
				max_clips : 3,
				spread : {hip : 10, aim : 8, prone : 6},
				kick : { hip : 3, aim : 2.5, prone : 2 },
				ads_mvspd : 0.75
			});
		}
		
		/*
		protected override function loadWeapGraphic():void {
			this.loadGraphic(Resource.IMPORT_WEAPON_AA12);
		}
		*/
	}

}