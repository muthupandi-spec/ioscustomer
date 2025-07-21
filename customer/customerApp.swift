

import SwiftUI
import FirebaseCore
import FirebaseMessaging
import UserNotifications
@main
struct customerApp: App {
    @State private var showSplash = true
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ZStack {
                if showSplash {
                    SplashScreenView()
                } else {
                    if UserDefaults.standard.integer(forKey: "customerID") != 0 {
                               HomePageView()
                           } else {
                               LoginView()
                           }
                
                }
            }
            .onAppear {
                // Delay for 3 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        showSplash = false
                    }
                    
                    
                }        }
        }
    }
}
