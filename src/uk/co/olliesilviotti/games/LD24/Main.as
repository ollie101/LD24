package uk.co.olliesilviotti.games.LD24 {
	import flash.display.Sprite;
	import flash.events.Event;
	import net.flashpunk.Engine;
	import net.flashpunk.FP
	
	/**
	 * ...
	 * @author ollie silviotti
	 */
	public class Main extends Engine {
		
		public function Main():void {
			super(960, 540, 60, true);
			FP.world = new GameWorld;
		}

	}
	
}