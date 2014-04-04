package  {
	import flash.display.Bitmap;
    import flash.utils.ByteArray;
	import flash.media.Sound;
	import org.flixel.plugin.photonstorm.FlxBitmapFont;
	public class Resource {
		
// accessories
		[Embed( source = "../resc/accessories/mouse_reticle.png" )] public static var IMPORT_MOUSE_RETICLE:Class;
		[Embed( source = "../resc/accessories/camera.jpg" )] public static var IMPORT_CAMERA_ICON:Class;

// bg
		[Embed( source = "../resc/bg/default_bg.jpg" )] public static var IMPORT_DEFAULT_BG:Class;

//player
		[Embed( source = "../resc/characters/player_body.png" )] public static var IMPORT_PLAYER_BODY:Class;
	}
}