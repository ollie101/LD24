package uk.co.olliesilviotti.games.LD24 {
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author ollie silviotti
	 */
	public class HealthDisplay extends Entity {	
		[Embed(source = "../../../../../../lib/health.png")] private const HEALTH_BG:Class;
		private var healthBar:Image;
		
		public function HealthDisplay(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) {
			var healthBarImg:BitmapData = new BitmapData(200, 20, true, 0xAAFF0000);
			healthBar = new Image(healthBarImg);
			healthBar.x = 10;
			healthBar.y = 10;
			
			graphic = new Graphiclist(new Image(HEALTH_BG), healthBar);
			x = 960 - 230;
			y = 10;
			
			super(x, y, graphic, mask);
		}
		
		override public function update():void {
			super.update();
			healthBar.scaleX = Player.health / Player.initHealth;
			if (Player.health == 0) {
				GameWorld(FP.world).bgMusic.stop();
				FP.world = new GameOver(GameWorld(FP.world).meteorsMissed);
			}
		}
		
	}

}