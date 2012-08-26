package uk.co.olliesilviotti.games.LD24 {
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author ollie silviotti
	 */
	public class PlayAgainBtn extends Entity {
		
		[Embed(source = "../../../../../../lib/play_again_btn.png")] private const PLAY_AGAIN_BTN:Class;
		[Embed(source = "../../../../../../lib/play_again_btn_hover.png")] private const PLAY_AGAIN_BTN_HOVER:Class;
		
		public function PlayAgainBtn(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) {
			width = 256;
			height = 128;
			graphic = new Image(PLAY_AGAIN_BTN);
			
			super(x, y, graphic, mask);
			
		}
		
		override public function update():void {
			super.update();
			
			if (Input.mouseX > x && Input.mouseX < x + width && Input.mouseY > y && Input.mouseY < y + height) {
				graphic = new Image(PLAY_AGAIN_BTN_HOVER);
				if (Input.mouseDown) {
					FP.world = new GameWorld;
				}
			} else {
				graphic = new Image(PLAY_AGAIN_BTN);
			}
		}
		
	}

}