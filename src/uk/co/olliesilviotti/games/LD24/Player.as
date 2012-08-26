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
		public static var health:uint = 10;
		public static var speed:uint = 5;
		
		private var lastDirLeft:Boolean = false;
		
		public function Player(x:Number = 0, y:Number = 0, graphic:Graphic = null, mask:Mask = null) {
			width = 128;
			height = 256;
			y = 540 - height;
			
			spriteSheet = new Spritemap(DINO_SPRITE, width, height);
			spriteSheet.add("runLeft", [6, 2, 7, 2], 0.5, true);
			spriteSheet.add("runRight", [4, 0, 5, 0], 0.5, true);
			spriteSheet.add("idleL", [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3], 0.5, true);
			spriteSheet.add("idleR", [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1], 0.5, true);
			
			graphic = new Graphiclist(spriteSheet);
			
			Input.define("left", Key.A, Key.LEFT);
			Input.define("right", Key.D, Key.RIGHT);
			Input.define("jump", Key.SPACE, Key.Z);
			
			super(x, y, graphic, mask);
		}
		
		public override function update():void {
			spriteSheet.color = 0xFFFFFF;
			if (Input.check("left")) {
				x -= Player.speed;
				spriteSheet.play("runLeft");
				if (x < 0) {
					x = 0;
				}
				
				lastDirLeft = true;
			}
			
			if (Input.check("right")) {
				x += Player.speed;
				spriteSheet.play("runRight");
				if (x > (960 - width)) {
					x = 960 - width;
				}
				
				lastDirLeft = false;
			}
			
			if (!Input.check("right") && !Input.check("left")) {
				if(lastDirLeft){
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
	}

}