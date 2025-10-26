import UIKit
import Firebase
import FirebaseMessaging
import UserNotifications
import GooglePlaces


class AppDelegate: NSObject, UIApplicationDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        Messaging.messaging().delegate = NotificationDelegate.shared
        UNUserNotificationCenter.current().delegate = NotificationDelegate.shared

        requestNotificationPermissions()
        GMSPlacesClient.provideAPIKey("AIzaSyCWQj746sQoI8ul4djjQjopk-YhISxmi9o")


        return true
    }

    func requestNotificationPermissions() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
            if granted {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
    }

    // Required for APNs token registration
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
    }
}
