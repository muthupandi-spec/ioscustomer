import SwiftUI
import FirebaseMessaging

struct SplashScreenView: View {
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            VStack {
                Image("ic_logo") // Add your logo image to Assets
                    .resizable()
                    .frame(width: 100, height: 100)
            }
        }
        .onAppear {
            getFCMToken()
        }
    }
    
    func getFCMToken() {
        Messaging.messaging().token { token, error in
            if let error = error {
                print("❌ Error getting FCM token: \(error.localizedDescription)")
            } else if let token = token {
                print("✅ FCM Token: \(token)")
                // You can also store or send this token to your backend
            }
        }
    }
}

struct Splash_view: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
