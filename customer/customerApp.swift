

import SwiftUI

@main
struct customerApp: App {
    @State private var showSplash = true
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if showSplash {
                    SplashScreenView()
                } else {
                    HomePageView()
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
