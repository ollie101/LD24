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
	public class SpeedUpBtn extends Entity {
		
		[Embed(source = "../../../../../../lib/speed_up_btn.png")] private const SPEED_BTN:Class;
		[Embed(source = "../../../../../../lib/speed_up_btn_hover.png")] private const SPEED_BTN_HOVER:Class;
		
		public function SpeedUpBtn(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) {
			width = 256;
			height = 128;
			graphic = new Image(SPEED_BTN);
			
			super(x, y, graphic, mask);
			
		}
		
		override public function update():void {
			super.update();
			
			if (Input.mouseX > x && Input.mouseX < x + width && Input.mouseY > y && Input.mouseY < y + height) {
				graphic = new Image(SPEED_BTN_HOVER);
				if (Input.mouseDown) {
					Player.speedUp();
					FP.world.nextRound();
				}
			} else {
				graphic = new Image(SPEED_BTN);
			}
		}
		
	}

}