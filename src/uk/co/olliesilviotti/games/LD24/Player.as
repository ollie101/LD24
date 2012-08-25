package uk.co.olliesilviotti.games.LD24 {
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author ollie silviotti
	 */
	public class Player extends Entity {
		
		[Embed(source = "../../../../../../lib/dino.png")] private const DINO_SPRITE:Class;
		private var spriteSheet:Spritemap;
		
		public function Player(x:Number = 0, y:Number = 0, graphic:Graphic = null, mask:Mask = null) {
			width = 128;
			height = 128;
			y = 540 - height;
			
			spriteSheet = new Spritemap(DINO_SPRITE, width, height);
			spriteSheet.add("runLeft", [1]);
			spriteSheet.add("runRight", [0]);
			
			graphic = new Graphiclist(spriteSheet);
			
			Input.define("left", Key.A, Key.LEFT);
			Input.define("right", Key.D, Key.RIGHT);
			Input.define("jump", Key.SPACE, Key.Z);
			
			super(x, y, graphic, mask);
			trace("what up playaaaaaaaaa");
		}
		
		public override function update():void {		
			if (Input.check("left")) {
				x -= 5;
				spriteSheet.play("runLeft");
				if (x < 0) {
					x = 0;
				}
			}
			
			if (Input.check("right")) {
				x += 5;
				spriteSheet.play("runRight");
				if (x > (960 - width)) {
					x = 960 - width;
				}
			}
			
			var meteor:Meteor = collide("meteor", x, y) as Meteor;
			if (meteor) {
				trace("HIT");
			}
		}
	}

}