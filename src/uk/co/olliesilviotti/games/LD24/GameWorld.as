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
		private var meteorsThisRound:uint = 2;
		private var meteorsThisRoundSoFar:uint = 0;
		private var isPaused:Boolean = true;
		public var player:Player;
		
		private const evScreen:EvolveScreen = new EvolveScreen();
		
		public function GameWorld() {
			super();
			player = new Player;
			
			addGraphic(new Image(BG_IMG));
			add(player);
			add(new HealthDisplay);
			isPaused = false;
		}
		
		override public function update():void {		
			super.update();
			
			if (!isPaused) {
				if(meteorsThisRoundSoFar < meteorsThisRound) {
					if (Math.random() * 100 > 96) {
						add(new Meteor(Math.random() * 960, -64));
						meteorsThisRoundSoFar++;
					}
				} else {
					if(typeCount("meteor") == 0){
						isPaused = true;
						
						if(typeCount("evolveScreen") == 0){
							add(evScreen);
						}
					}
				}
			} else {
				if (Player.lastDirLeft) {
					player.spriteSheet.setFrame(2, 0);
				} else {
					player.spriteSheet.setFrame(0, 0);
				}
			}
		}
		
		public function nextRound():void {
			currentRound++;
			meteorsThisRound = Math.ceil(meteorsThisRound * 1.2);
			meteorsThisRoundSoFar = 0;
			
			remove(evScreen);
			isPaused = false;
		}
		
		public function getIsPaused():Boolean {
			return isPaused ? true : false;
		}
	}

}