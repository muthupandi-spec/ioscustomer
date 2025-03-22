import SwiftUI

struct RecommendforyoyView: View {
    @State private var selectedChip: String? = nil // Track selected chip

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
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){

            VStack(alignment: .leading) {
              
                HStack {
                    Image("ic_back")
                        .resizable()
                        .frame(width: 23, height: 23)
                    
                    Text("Recommend For You")
                        .font(.system(size: 18))
                        .bold()
                        .padding(.horizontal,30)
                        .foregroundColor(.black)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 10)
                .padding(.horizontal)
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
        struct Recommendview: PreviewProvider {
            static var previews: some View {
                RecommendforyoyView()
            }
        }
}

