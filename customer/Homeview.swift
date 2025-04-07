import SwiftUI

struct HomeView: View {
    @State private var selectedChip: String? = nil // Track selected
    @State private var navigateOffer = false
    @State private var navigateCart = false
    @State private var navigateFavourite = false
    @State private var navigateNotification = false
    @State private var navigateRecommend = false
    @State private var navigateSearch = false
    @State private var navigateDetail = false
    
    @StateObject private var viewModel = HomeviewModel()
    
    let imageNames = ["ban", "ban1", "ban2"]
    let chiplist = ["Biryani", "Pizza", "Burger", "Noodles", "Dosa", "Mutton"]
    let varieties = [
        ("ic_biryani", "Biryani"),
        ("ic_biryani", "Pizza"),
        ("ic_biryani", "Burger"),
        ("ic_biryani", "Noodles"),
        ("ic_biryani", "Dosa"),
        ("ic_biryani", "Pasta"),
        ("ic_biryani", "Mutton")
    ]
    let columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 4)
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let errorMessage = viewModel.errorMessage {
//                    Text("Error: \(errorMessage)")
//                        .foregroundColor(.red)
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack(alignment: .leading) {
                            headerView
                            searchBar
                            specialOffersSection
                            specialofferlist
                            categorySection
                            branchesSection
                            bracheslistsection
                            recommendedSection
                            chipSelectionView
                            foodListView
                        }}
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment: .leading) {
                            headerView
                            searchBar
                            specialOffersSection
                            specialofferlist
                            categorySection
                            branchesSection
                            bracheslistsection
                            recommendedSection
                            chipSelectionView
                            foodListView
                        }
                    }
                }
            }
            
            
        }.onAppear {
            viewModel.getfood()
            viewModel.getbrach()
            viewModel.getcategory()

        }
    }
    
    private var headerView: some View {
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
            headerButtons
        }
        .frame(maxWidth: .infinity)
    }
    
    private var headerButtons: some View {
        HStack {
            navButton(image: "bell", isActive: $navigateNotification, destination: NotificationView())
            navButton(image: "heart", isActive: $navigateFavourite, destination: FavouriteView())
            navButton(image: "cart", isActive: $navigateCart, destination: CartView())
        }
    }
    
    private func navButton<V: View>(image: String, isActive: Binding<Bool>, destination: V) -> some View {
        Button(action: { isActive.wrappedValue = true }) {
            Image(image)
                .resizable()
                .frame(width: 25, height: 25)
                .padding()
                .background(Color.white)
        }
        .navigationDestination(isPresented: isActive) { destination }
    }
    
    private var searchBar: some View {
        Button(action: { navigateSearch = true }) {
            HStack {
                Image("search")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .foregroundColor(.gray)
                Text("What are you craving?")
                    .foregroundColor(.gray)
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 8).fill(Color.gray.opacity(0.2)))
            .padding(.horizontal, 10)
        }
        .navigationDestination(isPresented: $navigateSearch) { Searchview() }
    }
    
    private var specialOffersSection: some View {
        sectionHeader(title: "Special Offers", action: { navigateOffer = true })
            .navigationDestination(isPresented: $navigateOffer) { OfferView() }
    }
    
    private var categorySection: some View {
        VStack(alignment: .leading) {
            sectionHeader(title: "Top Category !", action: {})
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(varieties, id: \ .1) { variety in
                    VStack {
                        Image(variety.0)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                        Text(variety.1)
                            .foregroundColor(.black)
                            .font(.caption)
                    }
                    .cornerRadius(10)
                    .shadow(radius: 2)
                }
            }
            .padding(.horizontal, 10)
        }
    }
    private  var bracheslistsection:some View{
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
    }
    private var branchesSection: some View {
        sectionHeader(title: "Branches", action: {})
    }
    
    private var recommendedSection: some View {
        sectionHeader(title: "Recommended For You", action: { navigateRecommend = true })
            .navigationDestination(isPresented: $navigateRecommend) { RecommendforyoyView() }
    }
    
    private func sectionHeader(title: String, action: @escaping () -> Void) -> some View {
        HStack {
            Text(title).bold().foregroundColor(.black)
            Spacer()
            Button(action: action) {
                Text("See All").bold().foregroundColor(Color("colorPrimary"))
                    .opacity(1)
            }
        }
        .padding()
    }
    
    private var chipSelectionView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(chiplist, id: \ .self) { chipname in
                    Text(chipname)
                        .foregroundColor(selectedChip == chipname ? .white : Color("colorPrimary"))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(Capsule().fill(selectedChip == chipname ? Color("colorPrimary") : Color.clear))
                        .overlay(Capsule().stroke(Color("colorPrimary"), lineWidth: 1))
                        .onTapGesture { selectedChip = chipname
                            viewModel.getCategoryid(categoryId: "765786" )
                        }
                }
            }
            .padding(.horizontal, 10)
        }
    }
    
    
    private var specialofferlist:some View{
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
    }
    
    private var foodListView: some View {
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
                        navigateDetail=true
                    }
                }
            }
        }
        .navigationDestination(isPresented:$navigateDetail ) {
            ShopDetailView() // Destination view
        }
    }
}

struct HomeView_View: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
