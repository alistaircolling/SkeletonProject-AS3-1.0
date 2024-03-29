package agency.client.project.services {
	import agency.client.project.model.AppModel;
	import agency.client.project.model.vo.ProgressVO;
	import agency.client.project.signals.LoadingComplete;
	import agency.client.project.signals.ProgressSignal;

	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.CSSLoader;
	import com.greensock.loading.DataLoader;
	import com.greensock.loading.ImageLoader;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.MP3Loader;
	import com.greensock.loading.SWFLoader;
	import com.greensock.loading.VideoLoader;
	import com.greensock.loading.XMLLoader;

	import org.osflash.signals.Signal;
	import org.robotlegs.mvcs.Actor;

	/**
	 * model.services.XMLService
	 *
	 * @author YourName
	 */
	public class AssetService extends Actor {
		[Inject]
		public var appModel : AppModel;
		[Inject]
		public var progressSignal : ProgressSignal;
		[Inject]
		public var loadingComplete : LoadingComplete;
		private var _loader : XMLLoader;

		public function AssetService() : void {
			// Remeber to import each type of *Loader* you will be using
			LoaderMax.activate([ImageLoader, SWFLoader, DataLoader, MP3Loader, XMLLoader, VideoLoader, CSSLoader]);
		}

		public function load(path : String) : void {
			trace("AssetService.load(path)  ");
			_loader = new XMLLoader(path, {name:"main", onProgress:progressHandler, onComplete:completeHandler, onError:errorHandler});
			_loader.load();
		}

		private function completeHandler(e : LoaderEvent) : void {
			trace("AssetService.completeHandler(e)  ");
			loadingComplete.dispatch();
		}

		private function progressHandler(e : LoaderEvent) : void {
			trace("AssetService.ProgressHandler(e)  :"+e.target.progress);
			progressSignal.dispatch(new ProgressVO(e.target.progress));
		}

		private function errorHandler(e : LoaderEvent) : void {
			trace("AssetService.qErrorHandler(e)  ");
		}
	}
}