import SwiftUI

struct HomePageView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                         Text("Home")
                     
                }
            
            OrderViewpager()
                .tabItem {
                    Image(systemName: "doc.text.fill")
                    Text("Order")
                }
            
            WalletView()
                .tabItem {
                    Image(systemName: "wallet.pass.fill")
                    Text("Wallet")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}
struct Homepage_view: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}

