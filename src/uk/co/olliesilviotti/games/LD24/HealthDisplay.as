package uk.co.olliesilviotti.games.LD24 {
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author ollie silviotti
	 */
	public class HealthDisplay extends Entity {	
		
		private var healthBar:Image;
		
		public function HealthDisplay(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) {
			var healthBarImg:BitmapData = new BitmapData(200, 20, true, 0xAAFF0000);
			healthBar = new Image(healthBarImg);
			
			graphic = healthBar;
			x = 960 - 220;
			y = 20;
			
			super(x, y, graphic, mask);
		}
		
		override public function update():void {
			super.update();
			healthBar.scaleX = Player.health / 10;
			if (Player.health == 0) {
				FP.world = new GameOver;
			}
		}
		
	}

}