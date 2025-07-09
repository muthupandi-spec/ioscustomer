import Foundation
import FirebaseMessaging
import UserNotifications

class NotificationDelegate: NSObject, UNUserNotificationCenterDelegate, MessagingDelegate {
    
    static let shared = NotificationDelegate()
    
    // Called when FCM token is refreshed or retrieved
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("🔥 FCM Token: \(fcmToken ?? "No token")")
        
        // You can send the token to your backend here
    }

    // Handle notifications in foreground
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.sound, .banner, .list])
    }
}
