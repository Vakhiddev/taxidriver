import UIKit
import Flutter
import YandexMapsMobile
// import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // GMSServices.provideAPIKey("AIzaSyADmQFEsFCoQ5R-x9eDHvpkPjq-a9hH-wU")
    YMKMapKit.setApiKey("9d2fb289-ac1a-4f92-a596-391befc1a473")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
