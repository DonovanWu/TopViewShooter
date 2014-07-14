package guns 
{
	/**
	 * ...
	 * @author Wenrui Wu
	 */
	public class M1216 extends Gun
	{
		
		public function M1216() 
		{
			super( {
				name : "M1216",
				display_name : "Burst Shotgun",
				mobility : 1,
				speed : 10,
				rpm : 450,
				burst : [-4],
				brpm : 60,
				damage : [15, 7],
				range : [240, 280],
				pellets: 8,
				mag_size : 16,
				max_clips : 3,
				spread : {hip : 10, aim : 8, prone : 6},
				kick : { hip : 3, aim : 2.5, prone : 2 },
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