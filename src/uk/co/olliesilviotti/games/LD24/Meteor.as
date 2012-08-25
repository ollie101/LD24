package uk.co.olliesilviotti.games.LD24 {
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
		private var meteorSpriteMap:Spritemap;
		private var smokeSpriteMap:Spritemap;
		private var emitter:Emitter;
		private const _accel:Number = 0.1;
		private var _speed:Number = 1;
		
		public function Meteor(x:Number = 0, y:Number = 0, graphic:Graphic = null, mask:Mask = null) {
			width = 64;
			height = 64;
			
			smokeSpriteMap = new Spritemap(SMOKE_IMG, 64, 64);
			
			emitter = new Emitter(METEOR_IMG, 64, 64);
			emitter.newType("smokeTrail", [0, 1, 2, 3, 4, 5, 6, 7, 8]);
			
			graphic = new Graphiclist(meteorSpriteMap);
			
			setHitbox(width, height);
			type = "meteor";
			
			super(x, y, graphic, mask);
		}
		
		override public function update():void {
			super.update();
			_speed += _accel;
			y += _speed;
			
			if (y > 540) {
				FP.world.remove(this);
			}
		}
	}

}