package uk.co.olliesilviotti.games.LD24 {
	import net.flashpunk.graphics.Image;
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author ollie silviotti
	 */
	public class EvolveScreen extends Entity {
		
		[Embed(source = "../../../../../../lib/evScreenBg.png")] private const SCREEN_BG:Class;
		[Embed(source = "../../../../../../lib/speed_up_btn.png")] private const SPEED_BTN:Class;
		[Embed(source = "../../../../../../lib/speed_up_btn_hover.png")] private const SPEED_BTN_HOVER:Class;
		[Embed(source = "../../../../../../lib/shrink_btn.png")] private const SHRINK_BTN:Class;
		[Embed(source = "../../../../../../lib/shrink_btn_hover.png")] private const SHRINK_BTN_HOVER:Class;
		[Embed(source = "../../../../../../lib/health_up_btn.png")] private const HEALTH_UP_BTN:Class;
		[Embed(source = "../../../../../../lib/health_up_btn_hover.png")] private const HEALTH_UP_BTN_HOVER:Class;
		
		public var btnWidth:Number;
		public var btnHeight:Number;
		public var healthBtn:Image;
		public var healthBtnHover:Image;
		public var speedBtn:Image;
		public var speedBtnHover:Image;
		public var shrinkBtn:Image;
		public var shrinkBtnHover:Image;	
		public var gl:Graphiclist;		
		
		public function EvolveScreen(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) {
			btnWidth = 256;
			btnHeight = 128;
			
			healthBtn = new Image(HEALTH_UP_BTN);
			healthBtn.x = (960 / 3) - btnWidth - 40;
			healthBtn.y = (540 / 4) * 3;
			speedBtn = new Image(SPEED_BTN);
			speedBtn.x = ((960 / 3) * 2) - btnWidth - 40;
			speedBtn.y = (540 / 4) * 3;
			shrinkBtn = new Image(SHRINK_BTN);
			shrinkBtn.x = 960 - btnWidth - 40;
			shrinkBtn.y = (540 / 4) * 3;
			
			healthBtnHover = new Image(HEALTH_UP_BTN_HOVER);
			healthBtnHover.x = (960 / 3) - btnWidth - 40;
			healthBtnHover.y = (540 / 4) * 3;
			speedBtnHover = new Image(SPEED_BTN);
			speedBtnHover.x = ((960 / 3) * 2) - btnWidth - 40;
			speedBtnHover.y = (540 / 4) * 3;
			shrinkBtnHover = new Image(SHRINK_BTN);
			shrinkBtnHover.x = 960 - btnWidth - 40;
			shrinkBtnHover.y = (540 / 4) * 3;
			
			gl = new Graphiclist(new Image(SCREEN_BG), healthBtn, speedBtn, shrinkBtn);
			graphic = gl;
			type = "evolveScreen";
			
			super(x, y, graphic, mask);
			
		}
		
		override public function update():void {
			super.update();
			
			if ((Input.mouseX > healthBtn.x && Input.mouseX + btnWidth < healthBtn.x &&
				Input.mouseY > healthBtn.y && Input.mouseY + btnHeight < healthBtn.y) ||
				(Input.mouseX > healthBtnHover.x && Input.mouseX + btnWidth < healthBtnHover.x &&
				Input.mouseY > healthBtnHover.y && Input.mouseY + btnHeight < healthBtnHover.y)) {
					try {
						gl.remove(healthBtn);
					} catch (e:Error) { }
					
					gl.add(healthBtnHover);
				} else {
					try {
						gl.remove(healthBtnHover);
					} catch (e:Error) { }
					
					gl.add(healthBtn);
				}
				
			if ((Input.mouseX > speedBtn.x && Input.mouseX + btnWidth < speedBtn.x &&
				Input.mouseY > speedBtn.y && Input.mouseY + btnHeight < speedBtn.y) ||
				(Input.mouseX > speedBtnHover.x && Input.mouseX + btnWidth < speedBtnHover.x &&
				Input.mouseY > speedBtnHover.y && Input.mouseY + btnHeight < speedBtnHover.y)) {
					try {
						gl.remove(speedBtn);
					} catch (e:Error) { }
					
					gl.add(speedBtnHover);
				} else {
					try {
						gl.remove(speedBtnHover);
					} catch (e:Error) { }
					
					gl.add(speedBtn);
				}
				
			if ((Input.mouseX > shrinkBtn.x && Input.mouseX + btnWidth < shrinkBtn.x &&
				Input.mouseY > shrinkBtn.y && Input.mouseY + btnHeight < shrinkBtn.y) ||
				(Input.mouseX > shrinkBtnHover.x && Input.mouseX + btnWidth < shrinkBtnHover.x &&
				Input.mouseY > shrinkBtnHover.y && Input.mouseY + btnHeight < shrinkBtnHover.y)) {
					try {
						gl.remove(shrinkBtn);
					} catch (e:Error) { }
					
					gl.add(shrinkBtnHover);
				} else {
					try {
						gl.remove(shrinkBtnHover);
					} catch (e:Error) { }
					
					gl.add(shrinkBtn);
				}
		}
		
	}

}