package  {
	import flash.display.Sprite;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import org.flixel.*;
	import flash.geom.*;
	import flash.display.*;
	import flash.events.*;
	import flash.ui.*;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class Util {

		public static var WID:Number = 640;
		public static var HEI:Number = 640;
		
		public static var MOVE_LEFT:Vector.<String> = Vector.<String>(["A","LEFT"]);
		public static var MOVE_RIGHT:Vector.<String> = Vector.<String>(["D","RIGHT"]);
		public static var MOVE_UP:Vector.<String> = Vector.<String>(["W", "UP"]);
		public static var MOVE_DOWN:Vector.<String> = Vector.<String>(["S", "DOWN"]);
		public static var MOVE_SPRINT:Vector.<String> = Vector.<String>(["SHIFT"]);
		public static var TOGGLE_AIM:Vector.<String> = Vector.<String>(["SPACE"]);
		
		public static var MOVE_SPEED:Number = 1.0;
		public static var SPRINT_SPEED:Number = 2.5;
		
		public static const DEGREE:Number = 180 / Math.PI;
		public static const RADIAN:Number = Math.PI / 180;
		
		public static function float_random(min:Number, max:Number):Number {
			return min + Math.random() * (max - min);
		}
		
		public static function int_random(min:int, max:int):int {
			return Math.floor(float_random(min,max)) as int;
		}
		
		public static function is_key(k:Vector.<String>,jp:Boolean=false):Boolean {
			for each (var i:String in k) {
				if (jp) {
					if (FlxG.keys.justPressed(i)) {
						return true;
					}
				} else {
 					if (FlxG.keys[i]) {
						return true;
					}
				}
			}
			return false;
		}
		
		public static function get_bounds(game_obj:FlxGroup):Rectangle {
			var o:Object;
			for each (var s:FlxSprite in game_obj.members) {
				if (!o) {
					o = new Object;
					o.min_x = s.x;
					o.min_y = s.y;
					o.max_x = s.x + s.width;
					o.max_y = s.y + s.height;
				} else {
					o.min_x = Math.min(s.x,o.min_x);
					o.min_y = Math.min(s.y,o.min_y);
					o.max_x = Math.max(s.x + s.width,o.max_x);
					o.max_y = Math.max(s.y + s.height,o.max_y);
				}
			}
			return new Rectangle(o.min_x, o.min_y, o.max_x - o.min_x, o.max_y - o.min_y);
		}
		
		public static function round_dec(numIn:Number, decimalPlaces:int):Number {
			var nExp:int = Math.pow(10,decimalPlaces) ;
			var nRetVal:Number = Math.round(numIn * nExp) / nExp
			return nRetVal;
		}
		
		public static function sig_n(chk:Number,val:Number=1):Number {
			if (chk < 0) {
				return -val;
			} else if (chk > 0) {
				return val;
			} else {
				return val;
			}
		}
		
		public static function point_dist(ax:Number, ay:Number, bx:Number, by:Number):Number {
			return Math.sqrt(Math.pow(by - ay, 2) + Math.pow(bx - ax, 2));
		}
		
		private static var _cur_song:Sound;
		private static var _cur_play:SoundChannel;
		public static function play_bgm(o:Sound):void {
			if (_mute) {
				_cur_song = o;
				return;
			}
			if (o != _cur_song) {
				_cur_song = o;
				if (_cur_song != null && _cur_play != null ) _cur_play.stop();
				_cur_play = _cur_song.play(0, int.MAX_VALUE);
			}
		}
		
		private static var _mute:Boolean = false;
		public static function mute_toggle():void {
			_mute = !_mute;
			FlxG.mute = _mute;
			if (_mute && _cur_play != null) {
				_cur_play.stop();
			} else if (!_mute && _cur_song != null) {
				_cur_play = _cur_song.play(0, int.MAX_VALUE);
			}
			
		}
	}

}