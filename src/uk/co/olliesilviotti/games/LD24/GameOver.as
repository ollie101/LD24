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
			
			var playAgain:PlayAgainBtn = new PlayAgainBtn;
			add(playAgain);
			playAgain.x = 960 / 4 - (playAgain.width / 2);
			playAgain.y = (540 / 4) * 3 - (playAgain.height / 2);
		}
		
	}

}