package agency.client.project.view.components {
	import flash.display.Shape;
	import flash.display.Sprite;

	/**
	 * @author acollingtemp
	 */
	public class CustomButton extends Sprite {
		private var _bg : Shape;
		
		public function CustomButton() {
		
		
			initDisplay();	
			setButtonMode();
		}

		

		private function initDisplay() : void {
			
			_bg = new Shape();
			_bg.graphics.beginFill(0xffff00);
			_bg.graphics.drawRect(0, 0, 100, 70);
			addChild(_bg);
	
		}
		
		private function setButtonMode() : void {
			
			useHandCursor = true;
			buttonMode = true;
			mouseChildren = false;	
		}
		
		
	}
}
