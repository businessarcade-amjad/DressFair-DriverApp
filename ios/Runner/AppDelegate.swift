import UIKit
import Flutter
import GoogleMaps   // 👈 Add this import

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // ✅ Register your Google Maps API key
    GMSServices.provideAPIKey("AIzaSyCO5eBKSvPrBybXHItB5cIwBviLJlD6fPA")

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
