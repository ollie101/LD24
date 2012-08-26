package uk.co.olliesilviotti.games.LD24 {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP
	
	/**
	 * ...
	 * @author ollie silviotti
	 */
	public class Player extends Entity {
		
		[Embed(source = "../../../../../../lib/dinosheet.png")] private const DINO_SPRITE:Class;
		private var spriteSheet:Spritemap;
		
		public static var initHealth:uint = 10;
		public static var initSpeed:Number = 5;
		public static var initScale:Number = 1;
		public static var health:uint;
		public static var speed:Number;
		public static var scale:Number;
		
		public static const scaleIncr:Number = 0.98;
		public static const speedIncr:Number = 1.15;
		
		private static var lastDirLeft:Boolean = false;
		
		public function Player(x:Number = 0, y:Number = 0, graphic:Graphic = null, mask:Mask = null) {
			Player.reset();
			width = 128 * scale;
			height = 256 * scale;
			y = 540 - height;
			
			spriteSheet = new Spritemap(DINO_SPRITE, width, height);
			spriteSheet.add("runLeft", [6, 2, 7, 2], 0.5, true);
			spriteSheet.add("runRight", [4, 0, 5, 0], 0.5, true);
			spriteSheet.add("idleL", [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3], 0.5, true);
			spriteSheet.add("idleR", [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1], 0.5, true);
			
			spriteSheet.scale = scale;
			
			graphic = new Graphiclist(spriteSheet);
			
			Input.define("left", Key.A, Key.LEFT);
			Input.define("right", Key.D, Key.RIGHT);
			Input.define("jump", Key.SPACE, Key.Z);
			
			super(x, y, graphic, mask);
		}
		
		public override function update():void {
			width = 128 * scale;
			height = 256 * scale;
			y = 540 - height;
			spriteSheet.scale = scale;
			
			spriteSheet.color = 0xFFFFFF;
			if (Input.check("left")) {
				x -= Player.speed;
				spriteSheet.play("runLeft");
				if (x < 0) {
					x = 0;
				}
				
				Player.lastDirLeft = true;
			}
			
			if (Input.mousePressed) {
				speedUp();
			}
			
			if (Input.check("right")) {
				x += Player.speed;
				spriteSheet.play("runRight");
				if (x > (960 - width)) {
					x = 960 - width;
				}
				
				Player.lastDirLeft = false;
			}
			
			if (!Input.check("right") && !Input.check("left")) {
				if(Player.lastDirLeft){
					spriteSheet.play("idleL");
				} else {
					spriteSheet.play("idleR");
				}
			}
			
			var meteor:Meteor = collide("meteor", x, y) as Meteor;
			if (meteor) {
				meteor.explode();
				Player.health -= 1;
				spriteSheet.color = 0xFF0000;
			}
		}
		
		public static function speedUp():void {
			Player.speed *= speedIncr;
		}
		
		public static function shrink():void {
			Player.scale *= scaleIncr;
		}
		
		public static function healthUp():void {
			Player.health += 1;
		}
		
		public static function reset():void {
			Player.health = Player.initHealth;
			Player.speed = Player.initSpeed;
			Player.scale = Player.initScale;
			Player.lastDirLeft = false;
		}
	}

}