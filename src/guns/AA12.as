package guns 
{
	/**
	 * ...
	 * @author Wenrui Wu
	 */
	public class AA12 extends Gun {
		
		public function AA12() {
			super({
				name : "Full-auto Shotgun",
				mobility : 1,
				speed : 12,
				rpm : 400,
				burst : [0],
				brpm : 400,
				damage : [15, 5],
				range : [240, 300],
				pellets: 8,
				mag_size : 8,
				max_clips : 3,
				spread : {hip : 10, aim : 6, prone : 5},
				kick : { hip : 3, aim : 2, prone : 2 },
				ads_mvspd : 0.8
			});
		}
		
		protected override function loadWeapGraphic():void {
			this.loadGraphic(Resource.IMPORT_WEAPON_AA12);
		}
	}

}