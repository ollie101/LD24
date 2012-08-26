package uk.co.olliesilviotti.games.LD24 {
	import flash.display.Sprite;
	import flash.events.Event;
	import net.flashpunk.Engine;
	import net.flashpunk.FP
	import net.flashpunk.Splash;
	
	/**
	 * ...
	 * @author ollie silviotti
	 */
	public class Main extends Engine {
		
		public function Main():void {
			super(960, 540, 30, true);
			var s:Splash = new Splash(0xFF3366, 0X202020, 60, 20, 50, 720);
			FP.world.add(s);
			s.start(new Menu);
		}
	}
	
}