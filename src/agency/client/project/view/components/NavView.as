package agency.client.project.view.components {
	import org.osflash.signals.Signal;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author acollingtemp
	 */
	public class NavView extends Sprite {
		private var _button : CustomButton;
		public var clicked : Signal;
		
		
		public function NavView() {
				clicked = new Signal();
			(stage) ? initView() : addEventListener(Event.ADDED_TO_STAGE, onAddedToStage, false, 0, true);	
			
		}

		private function onAddedToStage(e:Event) : void {
			
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			initView();
		}

		private function initView() : void {
			
		
			createButton();
			
		}

		private function createButton() : void {
			
			_button = new CustomButton();
			_button.x = 300;
			_button.y = 20;
			addChild(_button);
			_button.addEventListener(MouseEvent.CLICK, onClick);
			
			
		}

		private function onClick(event : MouseEvent) : void {
			
			clicked.dispatch();
		}
		
		
	}
}
