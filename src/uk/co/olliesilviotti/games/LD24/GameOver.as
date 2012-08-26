package uk.co.olliesilviotti.games.LD24 {
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Text;
	import flash.net.URLRequestMethod;
	import flash.net.URLLoaderDataFormat;
	
	/**
	 * ...
	 * @author ollie silviotti
	 */
	public class GameOver extends World {
		
		[Embed(source = "../../../../../../lib/gobg.png")] private const GO_BG:Class;
		
		public function GameOver(finalScore:int) {
			super();
			
			sendToDB(finalScore);
			
			addGraphic(new Image(GO_BG));
		
			var meteorsText:Text = new Text(finalScore + " Asteroids successfully avoided", 0, 20);
			meteorsText.x = (960 / 2) - (meteorsText.width / 2);
			meteorsText.scale = 2;
			addGraphic(meteorsText);
			
			var playAgain:PlayAgainBtn = new PlayAgainBtn;
			add(playAgain);
			playAgain.x = 960 / 4 - (playAgain.width / 2);
			playAgain.y = (540 / 4) * 3 - (playAgain.height / 2);
		}
		
		private function sendToDB(finalScore:int):void {
			var vars:URLVariables = new URLVariables;
			vars.score = finalScore;
			
			var req:URLRequest = new URLRequest("http://olliesilviotti.co.uk/LD/24/saveScore.php");
			req.method = URLRequestMethod.POST;
			req.data = vars;
			
			var loader:URLLoader = new URLLoader;
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			
			try {
				loader.load(req);
			} catch(e:Error) {}
		}
	}

}