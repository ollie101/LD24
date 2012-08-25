package uk.co.olliesilviotti.games.LD24 {
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author ollie silviotti
	 */
	public class GameOver extends World {
		
		[Embed(source = "../../../../../../lib/gobg.png")] private const GO_BG:Class;
		
		public function GameOver() {
			super();
			
			addGraphic(new Image(GO_BG));
		}
		
	}

}