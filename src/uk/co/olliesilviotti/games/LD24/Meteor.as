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
	import net.flashpunk.Sfx;
	
	/**
	 * ...
	 * @author ollie silviotti
	 */
	public class Meteor extends Entity {
		
		[Embed(source = "../../../../../../lib/meteor.png")] private const METEOR_IMG:Class;
		[Embed(source = "../../../../../../lib/kitten.png")] private const KITTEN_IMG:Class;
		[Embed(source = "../../../../../../lib/smoke.png")] private const SMOKE_IMG:Class;
		[Embed(source = "../../../../../../lib/meteor_particles.png")] private const METEOR_PARTICLES:Class;
		[Embed(source = "../../../../../../lib/explode.mp3")] private const EXPL_SND:Class;
		private var meteorImg:Image;
		private var smokeSpriteMap:Spritemap;
		private var emitter:Emitter;
		private var _accel:Number = 0.3;
		private var _speed:Number = 1;
		private var _xVel:int;
		public var scale:Number = 1;
		private var _angleAccel:Number;
		private var _explosion:Sfx;
		
		public function Meteor(x:Number = 0, y:Number = 0, graphic:Graphic = null, mask:Mask = null, accelRound:Number = 0) {
			scale = Math.random() + 0.3;
			_angleAccel = Math.random() * 5 - 2.5;
			
			_accel += accelRound;
			
			width = 64 * scale;
			height = 64 * scale;
			
			_xVel = Math.random() * 6 - 3;
			
			if (Math.random() < 0.98) {
				meteorImg = new Image(METEOR_IMG);
			} else {
				meteorImg = new Image(KITTEN_IMG);
			}
			
			emitter = new Emitter(SMOKE_IMG, 32, 32);
			emitter.relative = false;
			emitter.newType("smokeTrail", [0]);
			emitter.setAlpha("smokeTrail", 0, 0.5);
			emitter.setColor("smokeTrail", 0xDD999999);
			emitter.setMotion("smokeTrail", 0, 100, 50, 50);
			
			emitter.setSource(METEOR_PARTICLES, 8, 8);
			emitter.newType("explode", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]);
			emitter.setAlpha("explode", 0, 1);
			emitter.setMotion("explode", 0, 100, 10, 360, -90, -5);
			
			meteorImg.scale = scale;
			graphic = new Graphiclist(meteorImg, emitter);
			
			setHitbox(width, height);
			type = "meteor";
			
			_explosion = new Sfx(EXPL_SND);
			
			super(x, y, graphic, mask);
		}
		
		override public function update():void {
			super.update();
			_speed += _accel;
			y += _speed;
			x += _xVel;
			
			if (y > 540) {
				FP.world.remove(this);
				if(collidable) {
					GameWorld(FP.world).meteorsMissed++;
				}
			}
			
			for (var i:uint = 0; i < 2; i++) {
				emitter.emit("smokeTrail", x + (width / 2), y);
			}
			
			if (!collidable && !meteorImg.visible && emitter.particleCount == 0) {
				FP.world.remove(this);
			}
			
			meteorImg.angle += _angleAccel;
		}
		
		public function explode():void {
			collidable = false;
			_explosion.play();
			
			for (var j:uint = 0; j < 50; j++) {
				emitter.emit("explode", x, y);
			}
			
			meteorImg.visible = false;
		}
	}

}