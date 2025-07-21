import SwiftUI

struct ProfileView: View {
    @State private var naviagte_editprofile = false
    @State private var naviagte_myorder = false
    @State private var naviagte_myfavourite = false
    @State private var naviagte_account = false
    @State private var naviagte_Address = false
    let phoneNumber = "" // Removed '+' from here for WhatsApp link

    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    header
                    cardheader
                    buttonllisst
                }
            }
        }
    }

    private var header: some View {
        HStack {
            Image("ic_logo")
                .resizable()
                .frame(width: 35, height: 35)
                .padding(.top, 12)

            Spacer()

            Text("Profile")
                .font(.headline)

            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 10)
        .padding(.horizontal)
    }

    private var cardheader: some View {
        HStack(spacing: 10) {
            ZStack {
                RoundedRectangle(cornerRadius: 50)
                    .fill(Color.white)
                    .frame(width: 52, height: 52)
                    .shadow(radius: 2)

                Image("boy")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 52, height: 52)
                    .clipShape(Circle())
            }

            VStack(alignment: .leading, spacing: 8) {
                Text(
                    (UserDefaults.standard.string(forKey: "userFirstName") ?? "") +
                    " " +
                    (UserDefaults.standard.string(forKey: "userLastName") ?? "")
                )
                .font(.system(size: 13, weight: .bold))
                .foregroundColor(Color.black.opacity(0.8))


                Text((UserDefaults.standard.string(forKey: "mobileNo") ?? ""))
                    .font(.system(size: 10))
                    .foregroundColor(Color.black.opacity(0.7))
            }
        }
        .padding(.top, 20)
        .padding()
    }

    private var buttonllisst: some View {
        VStack(spacing: 0) {
            profileButton(title: "Profile", icon: "person.circle", navigate: $naviagte_editprofile) {
                EditProfileView()
            }

            profileButton(title: "MyFavourite Restaurant", icon: "heart", navigate: $naviagte_myfavourite) {
                FavouriteView()
            }

            profileButton(title: "My Orders", icon: "cart", navigate: $naviagte_myorder) {
                OrderViewpager()
            }

            profileButton(title: "Address", icon: "map", navigate: $naviagte_Address) {
                AddressView()
            }

            Button(action: {
                openWhatsApp()
            }) {
                buttonRow(title: "Help", icon: "questionmark.circle")
            }
            .padding(.horizontal)

            profileButton(title: "Account Settings", icon: "person.2.fill", navigate: $naviagte_account) {
                AccountsettinngView()
            }
        }
    }

    private func profileButton<Destination: View>(title: String, icon: String, navigate: Binding<Bool>, @ViewBuilder destination: @escaping () -> Destination) -> some View {
        Button(action: {
            navigate.wrappedValue = true
        }) {
            buttonRow(title: title, icon: icon)
        }
        .navigationDestination(isPresented: navigate) {
            destination()
        }
        .padding(.horizontal)
    }

    private func buttonRow(title: String, icon: String) -> some View {
        VStack(spacing: 10) {
            HStack {
                Image(systemName: icon)
                    .resizable()
                    .frame(width: 18, height: 18)
                    .foregroundColor(.black)

                Text(title)
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(Color.black.opacity(0.8))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 10)

                Image("right-arrow")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            .padding(.vertical, 12)

            Rectangle()
                .frame(height: 2)
                .foregroundColor(Color.gray.opacity(0.5))
                .hidden()
        }
    }

    func openWhatsApp() {
        let message = "Hello, how can I help you?"
        let urlStr = "https://wa.me/\(phoneNumber)?text=\(message.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"

        if let url = URL(string: urlStr) {
            UIApplication.shared.open(url)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
