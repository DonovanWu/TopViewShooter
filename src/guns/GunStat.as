package guns 
{
	/**
	 * ...
	 * @author Wenrui Wu
	 */
	
	public class GunStat {
		// temporary class that will be replaced by json
		
		public var name:String;
		public var mobility:Number;
		public var speed:Number;
		public var rpm:Number;
		public var damage:Array;
		public var range:Array;
		public var mag_size:int;
		public var ammo_total:int;
		
		// default is assualt rifle
		public function GunStat() {
			// remember to prevent rpm that is less than or equal to 0
			name = "Assault Rifle";
			mobility = 0.9;
			speed = 15;
			rpm = 750;
			damage = [33, 22];
			range = [420, 960];
			mag_size = 30;
			ammo_total = 150;
		}
		
		public function set_stat(name:String, mobility:Number, speed:Number, rpm:Number, damage:Array,
								 range:Array, mag_size:int, ammo_total:int):void {
			this.name = name;
			this.mobility = mobility;
			this.speed = speed;
			this.rpm = rpm;
			this.mag_size = mag_size;
			this.ammo_total = ammo_total;
			
			/*
			if (range.length == 0) {
				range = [960];
			}
			if (damage.length == 0) {
				damage = [20];
			}
			*/
			if (range.length > damage.length) {
				range = range.slice(0, damage.length - 1);
			}
			
			this.damage = damage;
			this.range = range;
		}
	}

}