package uk.co.olliesilviotti.games.LD24 {
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author ollie silviotti
	 */
	public class GameWorld extends World {
		[Embed(source = "../../../../../../lib/bg.png")] private const BG_IMG:Class;
		[Embed(source = "../../../../../../lib/bu-an-awoken-witch.mp3")] private const BG_MUSIC:Class;

		private var currentRound:uint = 1;
		private var meteorsThisRound:uint = 20;
		private var meteorsThisRoundSoFar:uint = 0;
		private var isPaused:Boolean = true;
		public var player:Player;
		public var bgMusic:Sfx;
		public var meteorsMissed:uint = 0;
		private var meteorsText:Text;
		
		private const evScreen:EvolveScreen = new EvolveScreen();
		
		public function GameWorld() {
			super();
			player = new Player;
			
			meteorsText = new Text("0", 20, 20);
			meteorsText.scale = 2;
			
			addGraphic(new Image(BG_IMG));
			addGraphic(meteorsText);
			add(player);
			add(new HealthDisplay);
			isPaused = false;
			bgMusic = new Sfx(BG_MUSIC);
			bgMusic.loop();
		}
		
		override public function update():void {		
			super.update();
			
			meteorsText.text = "" + meteorsMissed;
			
			if (!isPaused) {
				if(meteorsThisRoundSoFar < meteorsThisRound) {
					if (Math.random() * 100 > (96 - currentRound)) {
						add(new Meteor(Math.random() * 890, -128, null, null, currentRound / 50));
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