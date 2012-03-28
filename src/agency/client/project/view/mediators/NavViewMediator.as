package agency.client.project.view.mediators {
	import agency.client.project.model.vo.SectionVO;
	import agency.client.project.signals.SectionSelected;
	import agency.client.project.view.components.NavView;
	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author acollingtemp
	 */
	public class NavViewMediator extends Mediator {
		
		[Inject]
		public var view:NavView;
		[Inject]
		public var sectionSelected:SectionSelected;

		override public function onRegister() : void {
			view.clicked.add(onNavClicked);	
		}
		override public function onRemove() : void {
			view.clicked.remove(onNavClicked);	
		}

		private function onNavClicked() : void {
			
			//this would be set depending on the content
			var vo:SectionVO = new SectionVO();
			vo.id = 0;
			vo.title = "Section 1";
			sectionSelected.dispatch(vo);
			
		}

	}
}
