package uk.co.olliesilviotti.games.LD24 {
	import net.flashpunk.graphics.Image;
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author ollie silviotti
	 */
	public class EvolveScreen extends Entity {
		
		public function EvolveScreen(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) {
			var blackoutData:BitmapData = new BitmapData(960, 540, true, 0x66000000);
			var blackout:Image = new Image(blackoutData);
			
			graphic = new Graphiclist(blackout);
			type = "evolveScreen";
			super(x, y, graphic, mask);
			
		}
		
	}

}