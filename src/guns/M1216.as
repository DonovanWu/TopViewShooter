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
				used_name : "Burst Shotgun",
				mobility : 1,
				speed : 12,
				rpm : 450,
				burst : [-4],
				brpm : 400,
				damage : [15, 10],
				range : [240, 300],
				pellets: 8,
				mag_size : 16,
				max_clips : 3,
				spread : {hip : 10, aim : 6, prone : 5},
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