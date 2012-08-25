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
		private var spriteMap:Spritemap;
		private var emitter:Emitter;
		private const _accel:Number = 0.1;
		private var _speed:Number = 1;
		
		public function Meteor(x:Number = 0, y:Number = 0, graphic:Graphic = null, mask:Mask = null) {
			spriteMap = new Spritemap(METEOR_IMG);
			graphic = new Graphiclist(spriteMap);
			
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