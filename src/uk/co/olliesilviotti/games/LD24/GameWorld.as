package uk.co.olliesilviotti.games.LD24 {
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author ollie silviotti
	 */
	public class GameWorld extends World {
		[Embed(source = "../../../../../../lib/bg.png")] private const BG_IMG:Class;
		
		public function GameWorld() {
			super();
			addGraphic(new Image(BG_IMG));
			add(new Player);
		
			
		}
		
		override public function update():void {
			super.update();
			if (Math.random() * 100 > 95) {
				add(new Meteor(Math.random() * 960, -64));
			}
		}
		
	}

}