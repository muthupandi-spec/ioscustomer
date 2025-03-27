import SwiftUI

struct ProfileView: View {
    @State private var naviagte_editprofile = false
    @State private var naviagte_myorder = false
    @State private var naviagte_myfavourite = false
    @State private var naviagte_account = false
    @State private var naviagte_Address = false
    let phoneNumber = "+971 56 479 8662" 

    var body: some View {
        NavigationStack{
            ScrollView(.vertical, showsIndicators: false){
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        Image("ic_logo")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .padding(.top, 12)
                        
                        Spacer() // Pushes text to center
                        
                        Text("Profile")
                            .font(.headline)
                        
                        Spacer() // Balances the text in the center
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)
                    .padding(.horizontal)
                    
                    HStack(spacing: 10) {
                        // Profile Image inside a Card (Similar to CardView)
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
                            Text("Muthu Pandi")
                                .font(.system(size: 13, weight: .bold))
                                .foregroundColor(Color.black.opacity(0.8)) // Semi-Black
                            
                            Text("9876543210")
                                .font(.system(size: 10))
                                .foregroundColor(Color.black.opacity(0.7))
                        }
                    }
                    .padding(.top, 20) //
                    .padding()
                    Button(action:{
                        naviagte_editprofile=true
                    }){
                        VStack(spacing: 10) {
                            HStack {
                                // Left Image
                                Image(systemName: "person.circle") // Replace with your asset
                                    .resizable()
                                    .frame(width: 18, height: 18)
                                    .foregroundColor(.black)
                                
                                // Card Name
                                Text("Profile") // Replace with localized string if needed
                                    .font(.system(size: 13, weight: .bold))
                                    .foregroundColor(Color.black.opacity(0.8))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal,10)
                                
                                
                                
                                // Next Button (Arrow)
                                Image("right-arrow") // Replace with your asset name
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            } .navigationDestination(isPresented: $naviagte_editprofile) {
                                EditProfileView()
                            }
                            .padding(.vertical, 12)
                            
                            // Optional Separator Line (Hidden by default)
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(Color.gray.opacity(0.5)) // Replace with your custom drawable
                                .hidden() // Equivalent to visibility = gone
                        }
                        .padding(.horizontal)
                    }
                    Button(action:{
                        naviagte_myfavourite=true
                    }){
                        VStack(spacing: 10) {
                            HStack {
                                // Left Image
                                Image(systemName: "heart") // Replace with your asset
                                    .resizable()
                                    .frame(width: 18, height: 18)
                                    .foregroundColor(.black)
                                
                                // Card Name
                                Text("MyFavourite Restaurant") // Replace with localized string if needed
                                    .font(.system(size: 13, weight: .bold))
                                    .foregroundColor(Color.black.opacity(0.8))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal,10)
                                
                                
                                
                                // Next Button (Arrow)
                                Image("right-arrow") // Replace with your asset name
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            } .navigationDestination(isPresented: $naviagte_myfavourite) {
                                FavouriteView()
                            }
                            .padding(.vertical, 12)
                            
                            // Optional Separator Line (Hidden by default)
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(Color.gray.opacity(0.5)) // Replace with your custom drawable
                                .hidden() // Equivalent to visibility = gone
                        }
                        .padding(.horizontal)
                    }
                    Button(action:{
                        naviagte_myorder=true
                    }){
                        VStack(spacing: 10) {
                            HStack {
                                // Left Image
                                Image(systemName: "cart") // Replace with your asset
                                    .resizable()
                                    .frame(width: 18, height: 18)
                                    .foregroundColor(.black)
                                
                                // Card Name
                                Text("My Orders") // Replace with localized string if needed
                                    .font(.system(size: 13, weight: .bold))
                                    .foregroundColor(Color.black.opacity(0.8))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal,10)
                                
                                
                                
                                // Next Button (Arrow)
                                Image("right-arrow") // Replace with your asset name
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            } .navigationDestination(isPresented: $naviagte_myorder) {
                                OrderViewpager()
                            }
                            .padding(.vertical, 12)
                            
                            // Optional Separator Line (Hidden by default)
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(Color.gray.opacity(0.5)) // Replace with your custom drawable
                                .hidden() // Equivalent to visibility = gone
                        }
                        .padding(.horizontal)
                    }
                    Button(action:{
                        naviagte_Address=true
                    }){
                        VStack(spacing: 10) {
                            HStack {
                                // Left Image
                                Image(systemName: "map") // Replace with your asset
                                    .resizable()
                                    .frame(width: 18, height: 18)
                                    .foregroundColor(.black)
                                
                                // Card Name
                                Text("Address") // Replace with localized string if needed
                                    .font(.system(size: 13, weight: .bold))
                                    .foregroundColor(Color.black.opacity(0.8))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal,10)
                                
                                
                                
                                // Next Button (Arrow)
                                Image("right-arrow") // Replace with your asset name
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            }
                            .padding(.vertical, 12)
                            
                            // Optional Separator Line (Hidden by default)
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(Color.gray.opacity(0.5)) // Replace with your custom drawable
                                .hidden() // Equivalent to visibility = gone
                        }.navigationDestination(isPresented: $naviagte_Address) {
                            AddressView()
                        }
                        .padding(.horizontal)
                    }
                    Button(action:{
                        openWhatsApp()
                    }){
                        VStack(spacing: 10) {
                            HStack {
                                // Left Image
                                Image(systemName:"questionmark.circle") // Replace with your asset
                                    .resizable()
                                    .frame(width: 18, height: 18)
                                    .foregroundColor(.black)
                                
                                // Card Name
                                Text("Help") // Replace with localized string if needed
                                    .font(.system(size: 13, weight: .bold))
                                    .foregroundColor(Color.black.opacity(0.8))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal,10)
                                
                                
                                
                                // Next Button (Arrow)
                                Image("right-arrow") // Replace with your asset name
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            }
                            .padding(.vertical, 12)
                            
                            // Optional Separator Line (Hidden by default)
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(Color.gray.opacity(0.5)) // Replace with your custom drawable
                                .hidden() // Equivalent to visibility = gone
                        }
                        .padding(.horizontal)
                    }
                    Button(action:{
                        naviagte_account=true
                    }){
                        VStack(spacing: 10) {
                            HStack {
                                // Left Image
                                Image(systemName: "person.2.fill") // Replace with your asset
                                    .resizable()
                                    .frame(width: 18, height: 18)
                                    .foregroundColor(.black)
                                
                                // Card Name
                                Text("Accout Settings") // Replace with localized string if needed
                                    .font(.system(size: 13, weight: .bold))
                                    .foregroundColor(Color.black.opacity(0.8))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal,10)
                                
                                
                                
                                // Next Button (Arrow)
                                Image("right-arrow") // Replace with your asset name
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            }
                            .padding(.vertical, 12)
                            
                            // Optional Separator Line (Hidden by default)
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(Color.gray.opacity(0.5)) // Replace with your custom drawable
                                .hidden() // Equivalent to visibility = gone
                        }.navigationDestination(isPresented: $naviagte_account) {
                            AccountsettinngView()
                        }
                        .padding(.horizontal)
                    }
                    
                    
                }
            }
            
        }
      
    }
    func openWhatsApp() {
          let message = "Hello, how can I help you?"
          let urlStr = "https://wa.me/\(phoneNumber)?text=\(message.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)"
          
          if let url = URL(string: urlStr) {
              UIApplication.shared.open(url)
          }
      }
    struct Profile_view: PreviewProvider {
        static var previews: some View {
            ProfileView()
        }
    }
}

