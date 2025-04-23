import SwiftUI

struct HomePageView: View {
    var body: some View {
        TabView {
            NavigationView {
                HomeView()
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }

            NavigationView {
                OrderViewpager()
            }
            .tabItem {
                Label("Order", systemImage: "doc.text.fill")
            }

            NavigationView {
                WalletView()
            }
            .tabItem {
                Label("Wallet", systemImage: "wallet.pass.fill")
            }

            NavigationView {
                ProfileView()
            }
            .tabItem {
                Label("Profile", systemImage: "person.fill")
            }
        }
    }
}
struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
