package guns 
{
	/**
	 * ...
	 * @author Wenrui Wu
	 */
	public class QBZ95 extends Gun {
		
		public function QBZ95() {
			super( {
				name: "QBZ95",
				display_name : "Burst Rifle",
				mobility : 0.9,
				speed : 15,
				rpm : 1000,
				burst : [3, 0],
				brpm : 160,
				damage : [35, 20],
				range : [420, 960],
				pellets: 1,
				mag_size : 300,
				max_clips : 3,
				spread : {hip : 10, aim : 1, prone : 1},
				kick : { hip : 5, aim : 1.5, prone : 1 },
				ads_mvspd : 0.5
			});
		}
		
		/*
		protected override function loadWeapGraphic():void {
			this.loadGraphic(Resource.IMPORT_WEAPON_M16);
		}
		*/
	}

}