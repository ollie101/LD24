package uk.co.olliesilviotti.games.LD24 {
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author ollie silviotti
	 */
	public class Menu extends World {
		
		[Embed(source = "../../../../../../lib/menubg.png")] private const MENU_BG:Class;
		
		private var playBtn:PlayBtn;
		
		public function Menu() {
			super();
			
			addGraphic(new Image(MENU_BG));
			
			playBtn = new PlayBtn;
			add(playBtn);
			playBtn.x = (960 / 2) - (playBtn.width / 2);
			playBtn.y = (540 / 2) - (playBtn.height / 2);
		}
		
	}

}