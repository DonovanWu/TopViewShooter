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
				display_name : "Pump-Action Shotgun",
				mobility : 1,
				speed : 10,
				rpm : 65,
				burst : [1],
				brpm : 65,
				damage : [30, 10],
				range : [300, 400],
				pellets: 8,
				mag_size : 8,
				max_clips : 3,
				spread : {hip : 6, aim : 3, prone : 2},
				kick : { hip : 3, aim : 2, prone : 2 },
				ads_mvspd : 0.75
			});
		}
		
		/*
		protected override function loadWeapGraphic():void {
			this.loadGraphic(Resource.IMPORT_WEAPON_M16);
		}
		*/
	}

}