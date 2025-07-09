

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
                    RegisterView()
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
