package agency.client.project {
	import agency.client.project.view.mediators.TitleMediator;
	import agency.client.project.view.components.TitleView;
	import agency.client.project.signals.SectionSet;
	import agency.client.project.controller.SectionSelectedCommand;
	import agency.client.project.signals.SectionSelected;
	import agency.client.project.view.mediators.NavViewMediator;
	import agency.client.project.view.components.NavView;
	import agency.client.project.controller.StartupCompleteCommand;
	import agency.client.project.model.AppModel;
	import agency.client.project.services.AssetService;
	import agency.client.project.signals.LoadingComplete;
	import agency.client.project.signals.ProgressSignal;
	import agency.client.project.view.components.PreloaderView;
	import agency.client.project.view.mediators.PreloaderMediator;
	import agency.client.project.view.mediators.StageMediator;

	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.SignalContext;


	public class ProjectContext extends SignalContext {

		public function ProjectContext(contextView : Main = null, autoStartup : Boolean = true) {
			super(contextView, autoStartup);
		}

		override public function startup() : void {
			trace("Context.startup()  ");
			mapController();
			mapSignals();
			mapModel();
			mapService();
			mapView();
			super.startup();
		}

		private function mapController() : void {
			//commandMap.mapEvent (ContextEvent.STARTUP_COMPLETE, StartupCompleteCommand, ContextEvent, true);
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartupCompleteCommand);
			//TODO add commands here
			signalCommandMap.mapSignalClass(SectionSelected, SectionSelectedCommand)
			
		}

	

		private function mapView() : void {
			mediatorMap.mapView(TitleView, TitleMediator);
			mediatorMap.mapView(PreloaderView, PreloaderMediator);
			mediatorMap.mapView(NavView, NavViewMediator);
			mediatorMap.mapView(Main, StageMediator);
		}
		
		private function mapSignals():void {
			injector.mapSingleton(ProgressSignal);
			injector.mapSingleton(LoadingComplete);
			injector.mapSingleton(SectionSet);
			
		}

		private function mapModel() : void {
			injector.mapSingleton(AppModel);
		}
		
		private function mapService() : void {
			injector.mapSingleton(AssetService);
			
		}

		

		
	}
}
