package  {
	import flash.display.Bitmap;
    import flash.utils.ByteArray;
	import flash.media.Sound;
	import org.flixel.plugin.photonstorm.FlxBitmapFont;
	public class Resource {
		
		[Embed( source = "../resc/hitbox_20x30.png" )] public static var IMPORT_HITBOX:Class;
		
// accessories
		[Embed( source = "../resc/accessories/mouse_reticle.png" )] public static var IMPORT_MOUSE_RETICLE:Class;
		[Embed( source = "../resc/accessories/camera.jpg" )] public static var IMPORT_CAMERA_ICON:Class;

// bg
		[Embed( source = "../resc/bg/default_bg.jpg" )] public static var IMPORT_DEFAULT_BG:Class;
		
// settings
		[Embed( source = "../resc/settings/box.png" )] public static var IMPORT_SET_BOX:Class;

// particles
		[Embed( source = "../resc/particles/bullet.png" )] public static var IMPORT_GUN_BULLET:Class;
		[Embed( source = "../resc/particles/particle_1x1.png" )] public static var IMPORT_PARTICLE_S:Class;
		[Embed( source = "../resc/particles/particle_2x2.png" )] public static var IMPORT_PARTICLE_L:Class;

// player
		[Embed( source = "../resc/characters/player_body.png" )] public static var IMPORT_PLAYER_BODY:Class;
		[Embed( source = "../resc/characters/player_limbs.png" )] public static var IMPORT_PLAYER_LIMBS:Class;
		
// weapons
		[Embed( source = "../resc/weapons/M16.png" )] public static var IMPORT_WEAPON_M16:Class;
		[Embed( source = "../resc/weapons/AA12.png" )] public static var IMPORT_WEAPON_AA12:Class;
	}
}