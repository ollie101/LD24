package uk.co.olliesilviotti.games.LD24 {
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Emitter;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Mask;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author ollie silviotti
	 */
	public class Meteor extends Entity {
		
		[Embed(source = "../../../../../../lib/meteor.png")] private const METEOR_IMG:Class;
		[Embed(source = "../../../../../../lib/smoke.png")] private const SMOKE_IMG:Class;
		[Embed(source = "../../../../../../lib/meteor_particles.png")] private const METEOR_PARTICLES:Class;
		private var meteorSpriteMap:Spritemap;
		private var smokeSpriteMap:Spritemap;
		private var emitter:Emitter;
		private const _accel:Number = 0.2;
		private var _speed:Number = 1;
		private var _xVel:int;
		
		public function Meteor(x:Number = 0, y:Number = 0, graphic:Graphic = null, mask:Mask = null) {
			width = 64;
			height = 64;
			
			_xVel = Math.random() * 6 - 3;
			
			meteorSpriteMap = new Spritemap(METEOR_IMG, 64, 64);
			
			emitter = new Emitter(SMOKE_IMG, 32, 32);
			emitter.relative = false;
			emitter.newType("smokeTrail", [0]);
			emitter.setAlpha("smokeTrail", 0, 0.2);
			emitter.setColor("smokeTrail", 0xDD999999);
			emitter.setMotion("smokeTrail", 0, 100, 50, 50);
			
			emitter.setSource(METEOR_PARTICLES, 8, 8);
			emitter.newType("explode", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]);
			emitter.setAlpha("explode", 0, 1);
			emitter.setMotion("explode", 0, 100, 10, 360, -90, -5);
			
			graphic = new Graphiclist(meteorSpriteMap, emitter);
			
			setHitbox(width, height);
			type = "meteor";
			
			super(x, y, graphic, mask);
		}
		
		override public function update():void {
			super.update();
			_speed += _accel;
			y += _speed;
			x += _xVel;
			
			if (y > 540) {
				FP.world.remove(this);
			}
			
			for (var i:uint = 0; i < 10; i++) {
				emitter.emit("smokeTrail", x, y);
			}
			
			if (!collidable && !meteorSpriteMap.visible && emitter.particleCount == 0) {
				FP.world.remove(this);
			}
		}
		
		public function explode():void {
			collidable = false;
			for (var j:uint = 0; j < 50; j++) {
				emitter.emit("explode", x, y + 60);
			}
			
			meteorSpriteMap.visible = false;
		}
	}

}