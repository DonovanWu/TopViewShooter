package guns 
{
	/**
	 * ...
	 * @author Wenrui Wu
	 */
	public class M16 extends Gun {
		
		public function M16() {
			super( {
				name : "M16",
				display_name : "Full-auto Rifle",
				mobility : 0.9,
				speed : 15,
				rpm : 750,
				burst : [0, 3],
				brpm : 750,
				damage : [33, 22],
				range : [420, 960],
				pellets: 1,
				mag_size : 300,
				max_clips : 3,
				spread : {hip : 8, aim : 2.5, prone : 1.5},
				kick : { hip : 5, aim : 3, prone : 2 },
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