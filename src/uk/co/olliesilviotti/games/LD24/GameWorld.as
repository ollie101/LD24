package uk.co.olliesilviotti.games.LD24 {
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author ollie silviotti
	 */
	public class GameWorld extends World {
		[Embed(source = "../../../../../../lib/bg.png")] private const BG_IMG:Class;
		
		private var currentRound:uint = 1;
		private var meteorsThisRound:uint = 20;
		private var meteorsThisRoundSoFar:uint = 0;
		private var isPaused:Boolean = true;
		
		public function GameWorld() {
			super();
			addGraphic(new Image(BG_IMG));
			add(new Player);
			add(new HealthDisplay);
			isPaused = false;
		}
		
		override public function update():void {		
			if (!isPaused) {
				super.update();
			}
			
			if(meteorsThisRoundSoFar < meteorsThisRound) {
				if (Math.random() * 100 > 96) {
					add(new Meteor(Math.random() * 960, -64));
					meteorsThisRoundSoFar++;
				}
			} else {
				if(typeCount("meteor") == 0){
					isPaused = true;
				}
				
				//currentRound++;
				//meteorsThisRound = Math.ceil(meteorsThisRound * 1.2);
				//meteorsThisRoundSoFar = 0;
			}
		}
		
	}

}