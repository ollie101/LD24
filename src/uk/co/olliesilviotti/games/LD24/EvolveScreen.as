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
		[Embed(source = "../../../../../../lib/nxt_round_btn.png")] private const NXT_ROUND_BTN:Class;
		[Embed(source = "../../../../../../lib/nxt_round_btn_hover.png")] private const NXT_ROUND_BTN_HOVER:Class;
		
		public var btnWidth:Number;
		public var btnHeight:Number;
		public var healthBtn:Image;
		public var healthBtnHover:Image;
		public var speedBtn:Image;
		public var speedBtnHover:Image;
		public var shrinkBtn:Image;
		public var shrinkBtnHover:Image;
		public var nxtBtn:Image;
		public var nxtBtnHover:Image;
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
			nxtBtn = new Image(NXT_ROUND_BTN);
			nxtBtn.x = ((960 / 3) * 2) - btnWidth - 40;
			nxtBtn.y = (540 / 4) * 3;
			shrinkBtn = new Image(SHRINK_BTN);
			shrinkBtn.x = 960 - btnWidth - 40;
			shrinkBtn.y = (540 / 4) * 3;
			
			healthBtnHover = new Image(HEALTH_UP_BTN_HOVER);
			healthBtnHover.x = (960 / 3) - btnWidth - 40;
			healthBtnHover.y = (540 / 4) * 3;
			speedBtnHover = new Image(SPEED_BTN_HOVER);
			speedBtnHover.x = ((960 / 3) * 2) - btnWidth - 40;
			speedBtnHover.y = (540 / 4) * 3;
			nxtBtnHover = new Image(NXT_ROUND_BTN_HOVER);
			nxtBtnHover.x = ((960 / 3) * 2) - btnWidth - 40;
			nxtBtnHover.y = (540 / 4) * 3;
			shrinkBtnHover = new Image(SHRINK_BTN_HOVER);
			shrinkBtnHover.x = 960 - btnWidth - 40;
			shrinkBtnHover.y = (540 / 4) * 3;
			
			gl = new Graphiclist(new Image(SCREEN_BG));
			graphic = gl;
			type = "evolveScreen";
			
			super(x, y, graphic, mask);
			
		}
		
		override public function update():void {
			super.update();
			
			var speedBtnVisible:Boolean = true;
			var scaleBtnVisible:Boolean = true;
			
			if ((Input.mouseX > healthBtn.x && Input.mouseX < healthBtn.x + btnWidth &&
				Input.mouseY > healthBtn.y && Input.mouseY < healthBtn.y + btnHeight) ||
				(Input.mouseX > healthBtnHover.x && Input.mouseX < healthBtnHover.x + btnWidth &&
				Input.mouseY > healthBtnHover.y && Input.mouseY < healthBtnHover.y + btnHeight)) {
					try {
						gl.remove(healthBtn);
						if(Input.mousePressed){
							Player.healthUp();
							GameWorld(FP.world).nextRound();
						}
					} catch (e:Error) { }
					
					gl.add(healthBtnHover);
				} else {
					try {
						gl.remove(healthBtnHover);
					} catch (e:Error) { }
					
					gl.add(healthBtn);
				}
	
			if(Player.speed < Player.initSpeed * 3) {
				if ((Input.mouseX > speedBtn.x && Input.mouseX < speedBtn.x + btnWidth &&
					Input.mouseY > speedBtn.y && Input.mouseY < speedBtn.y + btnHeight) ||
					(Input.mouseX > speedBtnHover.x && Input.mouseX < speedBtnHover.x + btnWidth &&
					Input.mouseY > speedBtnHover.y && Input.mouseY < speedBtnHover.y + btnHeight)) {
						try {
							gl.remove(speedBtn);
							if(Input.mousePressed){
								Player.speedUp();
								GameWorld(FP.world).nextRound();
							}
						} catch (e:Error) { }
						
						gl.add(speedBtnHover);
					} else {
						try {
							gl.remove(speedBtnHover);
						} catch (e:Error) { }
						
						gl.add(speedBtn);
					}
			} else {
				speedBtnVisible = false;
			}
			
			if (Player.scale > Player.initScale * 0.4) {
				if ((Input.mouseX > shrinkBtn.x && Input.mouseX < shrinkBtn.x + btnWidth &&
					Input.mouseY > shrinkBtn.y && Input.mouseY < shrinkBtn.y + btnHeight) ||
					(Input.mouseX > shrinkBtnHover.x && Input.mouseX < shrinkBtnHover.x + btnWidth &&
					Input.mouseY > shrinkBtnHover.y && Input.mouseY < shrinkBtnHover.y + btnHeight)) {
						try {
							gl.remove(shrinkBtn);
							if(Input.mousePressed){
								Player.shrink();
								GameWorld(FP.world).nextRound();
							}
						} catch (e:Error) { }
						
						gl.add(shrinkBtnHover);
					} else {
						try {
							gl.remove(shrinkBtnHover);
						} catch (e:Error) { }
						
						gl.add(shrinkBtn);
					}
			} else {
				scaleBtnVisible = false;
			}
			
			if (!speedBtnVisible) {
				try {
					gl.remove(speedBtn);
				} catch (e:Error) { }
				try {
					gl.remove(speedBtnHover);
				} catch (e:Error) { }
			}
			
			if (!scaleBtnVisible) {
				try {
					gl.remove(shrinkBtn);
				} catch (e:Error) { }
				try {
					gl.remove(shrinkBtnHover);
				} catch (e:Error) { }
				
			}
		}
		
	}

}