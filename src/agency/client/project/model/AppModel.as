package agency.client.project.model {
	import agency.client.project.signals.SectionSet;
	import agency.client.project.model.vo.SectionVO;
	import org.robotlegs.mvcs.Actor;

	/**
	 * model.AppModel
	 *
	 * @author YourName
	 */
	public class AppModel extends Actor {
		
		[Inject]
		public var sectionSet:SectionSet;
		
		private var _currentSection : SectionVO;
		
		
		

		public function AppModel() : void {
		}

		public function get currentSection() : SectionVO {
			return _currentSection;
		}

		public function set currentSection(currentSection : SectionVO) : void {
			_currentSection = currentSection;
			sectionSet.dispatch(_currentSection);
		}
		
		
	}
}