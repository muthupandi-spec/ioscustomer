import SwiftUI

struct FavouriteView: View {
    let varieties = [
        ("ic_biryani", "Biryani"),
        ("ic_biryani", "Pizza"),
        ("ic_biryani", "Burger"),
        ("ic_biryani", "Noodles"),
        ("ic_biryani", "Dosa"),
        ("ic_biryani", "Pasta"),
        ("ic_biryani", "Mutton"),
    ]
    @StateObject private var viewModel = HomeviewModel()

    var body: some View {
        NavigationStack{
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let errorMessage = viewModel.errorMessage {
                ScrollView(.vertical, showsIndicators: false){
                    VStack(alignment: .leading) {
                        header
                        foodview
                        
                    }
                }

            } else {
                ScrollView(.vertical, showsIndicators: false){
                    VStack(alignment: .leading) {
                        header
                        foodview
                        
                    }
                }
            }
        }.onAppear{
            viewModel.getfavourite()
        }
    }
    private var header:some View{
        HStack {
            Image("ic_back")
                .resizable()
                .frame(width: 23, height: 23)
            
            Text("My Favourite")
                .font(.system(size: 18))
                .bold()
                .padding(.horizontal,30)
                .foregroundColor(.black)
        } .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 10)
            .padding(.horizontal)
        
    }
    private var foodview:some View{
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
    
    struct Favourite_view: PreviewProvider {
        static var previews: some View {
            FavouriteView()
        }
    }
}

