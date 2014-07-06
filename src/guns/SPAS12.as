package guns 
{
	/**
	 * ...
	 * @author Wenrui Wu
	 */
	public class SPAS12 extends Gun {
		
		public function SPAS12() {
			super( {
				name: "SPAS12",
				used_name : "Semi-auto Shotgun",
				mobility : 1,
				speed : 12,
				rpm : 180,
				burst : [1],
				brpm : 240,
				damage : [20, 10],
				range : [300, 360],
				pellets: 8,
				mag_size : 8,
				max_clips : 3,
				spread : {hip : 6, aim : 3, prone : 3},
				kick : { hip : 3, aim : 2, prone : 2 },
				ads_mvspd : 0.8
			});
		}
		
		/*
		protected override function loadWeapGraphic():void {
			this.loadGraphic(Resource.IMPORT_WEAPON_M16);
		}
		*/
	}

}