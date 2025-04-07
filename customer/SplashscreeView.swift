import SwiftUI

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
    }
}
struct Splash_view: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}

