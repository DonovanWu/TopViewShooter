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
		
		// default is assualt rifle
		public function GunStat() {
			name = "Assualt Rifle";
			mobility = 0.9;
			speed = 15;
			rpm = 5;
			damage = [33, 22];
			range = [420, 960];
		}
		
		public function set_stat(name:String, mobility:Number, speed:Number, rpm:Number, damage:Array, range:Array):void {
			this.name = name;
			this.mobility = mobility;
			this.speed = speed;
			this.rpm = rpm;
			
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