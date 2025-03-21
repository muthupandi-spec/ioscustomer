import SwiftUI

struct HomeView: View {
    @State private var selectedChip: String? = nil // Track selected chip

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
                    
                    
                    Image("bell")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .padding()
                        .background(Color.white)
                    Image("heart")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .padding()
                        .background(Color.white)
                    Image("cart")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .padding()
                        .background(Color.white)
                    
                }
                .frame(maxWidth: .infinity)
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
                .padding(.horizontal, 10) // Add extra 5 points of space outside
                HStack {
                    Text("Special Offers")
                        .bold()
                        .foregroundColor(.black)
                    
                    Spacer() // Pushes "See All" to the right
                    
                    Text("See All")
                        .bold()
                        .foregroundColor(Color("colorPrimary"))
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
                    .padding(.horizontal, 10) // Add padding for a nice look
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
                HStack {
                    Text("Recommended For You")
                        .bold()
                        .foregroundColor(.black)
                    
                    Spacer() // Pushes "See All" to the right
                    
                    Text("See All")
                        .bold()
                        .foregroundColor(Color("colorPrimary"))
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
                    VStack(spacing: 10) { // Adds spacing between each item
                        ForEach(0..<5, id: \.self) { _ in
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
                        }
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
