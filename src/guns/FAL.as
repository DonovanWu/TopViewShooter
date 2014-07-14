package guns 
{
	/**
	 * ...
	 * @author Wenrui Wu
	 */
	public class FAL extends Gun{
		
		public function FAL() {
			super( {
				name : "FAL",
				display_name : "Semi-auto Rifle",
				mobility : 0.9,
				speed : 15,
				rpm : 300,
				burst : [1, 0],
				brpm : 400,
				damage : [49, 35],
				range : [420, 960],
				pellets: 1,
				mag_size : 240,
				max_clips : 3,
				spread : { hip : 10, aim : 1, prone : 0.5 },
				kick : { hip : 5, aim : 1, prone : 0.5 },
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