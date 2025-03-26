import SwiftUI

struct HomeView: View {
    @State private var selectedChip: String? = nil // Track selected
    @State private var naviagte_offer = false
    @State private var naviagte_cart = false
    @State private var naviagte_favourite = false
    @State private var naviagte_notification = false
    @State private var naviagte_recomend = false
    @State private var naviagte_search = false
    @State private var navigate_detail = false  // State variable for navigation


    let imageNames = ["ban", "ban1", "ban2"]
    let chiplist = ["Biryani", "Pizza", "Burger","Noodles","Dosa","Mutton"]
    let varieties = [
           ("ic_biryani", "Biryani"),
           ("ic_biryani", "Pizza"),
           ("ic_biryani", "Burger"),
           ("ic_biryani", "Noodles"),
           ("ic_biryani", "Dosa"),
           ("ic_biryani", "Pasta"),
           ("ic_biryani", "Mutton"),
       ]
    let columns = [
          GridItem(.flexible(), spacing: 10),
          GridItem(.flexible(), spacing: 10),
          GridItem(.flexible(), spacing: 10),
          GridItem(.flexible(), spacing: 10),
      ]
    var body: some View {
        NavigationStack{
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .leading) {
                    HStack {
                        Image("user")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding()
                            .background(Color.white)
                        
                        VStack(alignment: .leading) {
                            Text("Deliver to")
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                            
                            Text("Madurai")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        
                        Button(action: {
                            // Add your action here, e.g., navigate or show an alert
                            print("Bell icon clicked!")
                            naviagte_notification=true
                        }) {
                            Image("bell")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .padding()
                                .background(Color.white)
                            
                        } .navigationDestination(isPresented: $naviagte_notification) {
                            NotificationView()
                        }
                        Button(action: {
                            naviagte_favourite=true
                        }) {
                            Image("heart")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .padding()
                                .background(Color.white)
                        }.navigationDestination(isPresented: $naviagte_favourite) {
                            FavouriteView()
                        }
                        Button(action: {
                            naviagte_cart=true
                        }) {
                            Image("cart")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .padding()
                                .background(Color.white)
                        }.navigationDestination(isPresented: $naviagte_cart) {
                            CartView()
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                    Button(action: {
                        naviagte_search=true
                    }) {
                        HStack {
                            Image("search")
                                .renderingMode(.template) // Allows color modification
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16, height: 16)
                                .foregroundColor(.gray) // Set image color
                            
                            Text("What are you craving?")
                                .foregroundColor(.gray) // Match the text color
                            
                            Spacer() // Push content to the left
                        }
                        
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.gray.opacity(0.2)))
                        .padding(.horizontal, 10)
                    }.navigationDestination(isPresented: $naviagte_search) {
                        Searchview()
                    }
                    HStack {
                        Text("Special Offers")
                            .bold()
                            .foregroundColor(.black)
                        
                        Spacer() // Pushes "See All" to the right
                        Button(action:{
                            naviagte_offer=true
                        }){
                            Text("See All")
                                .bold()
                                .foregroundColor(Color("colorPrimary"))
                        } .navigationDestination(isPresented: $naviagte_offer) {
                            OfferView()
                        }
                        
                    }
                    .padding()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(imageNames, id: \.self) { imageName in
                                Image(imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: UIScreen.main.bounds.width - 100, height: 160)
                                    .clipped()
                                    .cornerRadius(10)
                            }
                        }
                        .padding(.horizontal, 10)
                    }
                    HStack {
                        Text("Top Category !")
                            .bold()
                            .foregroundColor(.black)
                        
                        Spacer() // Pushes "See All" to the right
                        
                        Text("See All")
                            .bold()
                            .foregroundColor(Color("colorPrimary"))
                    }
                    .padding()
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(varieties, id: \.1) { variety in
                            VStack {
                                Image(variety.0)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60) // Adjust image size
                                Text(variety.1)
                                    .foregroundColor(.black)
                                    .font(.caption)
                            }
                            .cornerRadius(10)
                            .shadow(radius: 2)
                        }
                    }
                    .padding(.horizontal,10)
                   
                      
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) { // Ensures items are aligned in a row
                            ForEach(0..<3, id: \.self) { _ in
                                VStack(spacing: 10) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color(UIColor.systemGray5))
                                            .frame(width: 150, height: 150)
                                        
                                        Image("ic_bir") // Replace with actual image asset
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 140, height: 140)
                                            .clipShape(RoundedRectangle(cornerRadius: 11))
                                    }
                                    .overlay(
                                        HStack {
                                            Spacer()
                                            Image(systemName: "heart.fill")
                                                .foregroundColor(.red)
                                                .padding(8)
                                                .background(Circle().fill(Color.white))
                                                .opacity(0) // Initially hidden
                                                .offset(x: -10, y: 10)
                                        }
                                    )
                                    
                                    Text("Basha Bhai Restaurant")
                                        .font(.headline)
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.center)
                                        .frame(width: 150)
                                    
                                    HStack {
                                        Text("Branch:")
                                            .font(.subheadline)
                                            .bold()
                                        Text("Al Karama")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                                .shadow(radius: 2)
                                .padding(.vertical)
                            }
                        }
                        .padding(.horizontal) // Ensures smooth horizontal
                    }
                    HStack {
                      
                            Text("Recommended For You")
                                .bold()
                                .foregroundColor(.black)
                        
                        Spacer() // Pushes "See All" to the right
                    Button(action: {
                        naviagte_recomend=true
                    }){
                        Text("See All")
                            .bold()
                            .foregroundColor(Color("colorPrimary"))
                    } .navigationDestination(isPresented: $naviagte_recomend) {
                        RecommendforyoyView()
                    }
                    }
                    .padding()
                    ScrollView(.horizontal, showsIndicators: false) {
                               HStack(spacing: 10) {
                                   ForEach(chiplist, id: \.self) { chipname in
                                       Text(chipname)
                                           .foregroundColor(selectedChip == chipname ? .white : Color("colorPrimary")) // Change text color
                                           .padding(.horizontal, 10)
                                           .padding(.vertical, 5)
                                           .background(
                                               Capsule()
                                                   .fill(selectedChip == chipname ? Color("colorPrimary") : Color.clear) // Background color
                                                   .overlay(
                                                       Capsule()
                                                           .stroke(Color("colorPrimary"), lineWidth: 1) // Border
                                                   )
                                           )
                                           .onTapGesture {
                                               selectedChip = chipname // Update selected item
                                           }
                                   }
                               }
                               .padding(.horizontal, 10)
            
                           }
                 
                               ScrollView {
                                   ForEach(0..<5, id: \.self) { index in
                                       HStack {
                                           ZStack(alignment: .bottomLeading) {
                                               Image("ic_biryani")
                                                   .resizable()
                                                   .frame(width: 142, height: 172)
                                                   .scaledToFill()
                                                   .clipShape(RoundedRectangle(cornerRadius: 12))

                                               VStack(alignment: .leading, spacing: 4) {
                                                   Text("UPTO 23%")
                                                       .font(.caption)
                                                       .bold()
                                                       .foregroundColor(.white)
                                                       .padding(6)
                                                       .background(Color.black.opacity(0.5))
                                                       .clipShape(Capsule())

                                                   Text("Offer")
                                                       .font(.footnote)
                                                       .bold()
                                                       .foregroundColor(.black)
                                               }
                                               .padding(8)
                                           }
                                           .background(Color.white)
                                           .clipShape(RoundedRectangle(cornerRadius: 12))
                                           .overlay(
                                               Image("heart") // Favorite Icon
                                                   .resizable()
                                                   .frame(width: 20, height: 20)
                                                   .padding(8),
                                               alignment: .topTrailing
                                           )

                                           VStack(alignment: .leading, spacing: 4) {
                                               Text("Biryani")
                                                   .font(.headline)
                                                   .bold()
                                                   .foregroundColor(.black)

                                               Text("Delicious Biryani")
                                                   .font(.subheadline)
                                                   .foregroundColor(.gray)

                                               HStack {
                                                   Image("star") // Rating Star Image
                                                       .resizable()
                                                       .frame(width: 18, height: 18)

                                                   Text("4.5 | 5.0 reviews")
                                                       .font(.caption)
                                                       .foregroundColor(.black)
                                               }

                                               Text("Branch:")
                                                   .font(.caption)
                                                   .bold()
                                                   .foregroundColor(.black)

                                               Text("Al Karma And Dubai Silicon Oasis")
                                                   .font(.caption)
                                                   .foregroundColor(.black)
                                                   .lineLimit(1)
                                                   .truncationMode(.tail)
                                                   .frame(maxWidth: .infinity, alignment: .leading)
                                           }
                                           .padding(.vertical, 6)
                                       }
                                       .background(Color.white)
                                       .cornerRadius(10)
                                       .shadow(radius: 1)
                                       .padding(10) // Adds padding on all sides
                                       .onTapGesture {
                                           if index == 0 { // Navigate only for the first item
                                          navigate_detail=true
                                           }
                                       }
                                   }
                               }
                               .navigationDestination(isPresented: $navigate_detail) {
                                   ShopDetailView() // Destination view
                               }
                           

                    
                }
            }

        }
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}
