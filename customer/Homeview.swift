import SwiftUI

struct HomeView: View {
    @State private var selectedChip: CategoriesResponseModelItem? = nil
    @State private var navigateOffer = false
    @State private var navigateCart = false
    @State private var navigateFavourite = false
    @State private var navigateNotification = false
    @State private var navigateRecommend = false
    @State private var navigateSearch = false
    @State private var navigateDetail = false
    @State private var navigateRestaurat = false
    @AppStorage("selectedRestaurantId") var selectedRestaurantId: Int = 0
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
//            viewModel.getfood()
            viewModel.getoffer()
            viewModel.getbrach()
            viewModel.getcategory()
            let customerId = UserDefaults.standard.integer(forKey: "customerID") // Or hardcode for testing
                        viewModel.getProfile(customerId: customerId)

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
        .fullScreenCover(isPresented: isActive) { destination }
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
        }.fullScreenCover(isPresented: $navigateSearch) {
            Searchview()
        }
      
    }
    
    private var specialOffersSection: some View {
        sectionHeader(title: "Special Offers", action: { navigateOffer = true })
            .fullScreenCover(isPresented: $navigateOffer) { OfferView() }
    }
    
    private var categorySection: some View {
        VStack(alignment: .leading) {
            sectionHeader(title: "Top Category !", action: {})
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(viewModel.categoriew) { chip in
                    VStack {
                        Image("ic_biryani")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                        Text(chip.category)
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
                ForEach(viewModel.restaurantmodel) { branch in
                    VStack(spacing: 10) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color(UIColor.systemGray5))
                                .frame(width: 150, height: 150)
                            
                            if let imageData = Data(base64Encoded:branch.images[0].imageData),
                               let uiImage = UIImage(data: imageData) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 140, height: 140)
                                    .clipShape(RoundedRectangle(cornerRadius: 11))
                            } else {
                                Color.gray
                                    .frame(width: 140, height: 140)
                                    .clipShape(RoundedRectangle(cornerRadius: 11))
                                    .overlay(Text("Invalid Image").font(.caption).foregroundColor(.white))
                            }

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
                        
                        Text(branch.restaurantName)
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
                    .padding(.vertical) .onTapGesture {
                   
                        selectedRestaurantId = branch.restaurantId
                           navigateRestaurat = true
                        let id=branch.restaurantId
                            navigateRestaurat = true
                        
                    }
                }
            }
            .padding(.horizontal) // Ensures smooth horizontal
        }.fullScreenCover(isPresented: $navigateRestaurat) {
            RestaurantView()
        }
    }
    private var branchesSection: some View {
        sectionHeader(title: "Branches", action: {})
    }
    
    private var recommendedSection: some View {
        sectionHeader(title: "Recommended For You", action: { navigateRecommend = true })
            .fullScreenCover(isPresented: $navigateRecommend) { RecommendforyoyView() }
    }
    
    private func sectionHeader(title: String, action: @escaping () -> Void) -> some View {
        HStack {
            Text(title).bold().foregroundColor(.black)
            Spacer()
            Button(action: action) {
                Text("See All").bold().foregroundColor(Color("colorPrimary"))
                    .opacity(0)
            }
        }
        .padding()
    }
    
    private var chipSelectionView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(viewModel.categoriew) { chip in
                    Text(chip.category)
                        .foregroundColor(selectedChip?.categoryId == chip.categoryId ? .white : Color("colorPrimary"))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(
                            Capsule()
                                .fill(selectedChip?.categoryId == chip.categoryId ? Color("colorPrimary") : Color.clear)
                        )
                        .overlay(
                            Capsule()
                                .stroke(Color("colorPrimary"), lineWidth: 1)
                        )
                        .onTapGesture {
                            selectedChip = chip
                            viewModel.getCategoryid(categoryId: String(chip.categoryId))
                        }
                }
            }
            .padding(.horizontal, 10)
        }
        .onChange(of: viewModel.categoriew) { newList in
            if selectedChip == nil, let firstChip = newList.first {
                selectedChip = firstChip
                viewModel.getCategoryid(categoryId: String(firstChip.categoryId))
            }
        }
    }

    
    private var specialofferlist: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(viewModel.offermodel, id: \.id) { imageName in
                    VStack(alignment: .leading) {
                        if let imageData = Data(base64Encoded: imageName.image),
                           let uiImage = UIImage(data: imageData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width - 100, height: 160)
                                .clipped()
                                .cornerRadius(10)
                        } else {
                            Color.gray
                                .frame(width: UIScreen.main.bounds.width - 100, height: 160)
                                .cornerRadius(10)
                                .overlay(Text("Invalid Image").foregroundColor(.white))
                        }
                    
                    }
                    .onAppear {
                        
                       }
                }
            }
            .padding(.horizontal, 10)
        }
    }


    private var foodListView: some View {
        
        ScrollView {
                 ForEach(Array(viewModel.fooddetailrespose.enumerated()), id: \.element.foodId) { index, food in
                     HStack {
                         ZStack(alignment: .bottomLeading) {
                             if let imageData = Data(base64Encoded: food.image),
                                let uiImage = UIImage(data: imageData) {
                                 Image(uiImage: uiImage)
                                     .resizable()
                                     .frame(width: 142, height: 172)
                                     .scaledToFill()
                                     .clipShape(RoundedRectangle(cornerRadius: 12))
                             } else {
                                 Image("placeholder_image")
                                     .resizable()
                                     .frame(width: 142, height: 172)
                                     .scaledToFill()
                                     .clipShape(RoundedRectangle(cornerRadius: 12))
                             }

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
                             Button(action: {

                                 print("❤️ Heart tapped for foodId: \(food.foodId)")
                                 viewModel.createfavourite(foodid:food.foodId) { result in
                                     switch result {
                                     case .success(let response):
                                         print("✅ Address Created: \(response)")
                                     case .failure(let error):
                                         print("✅ failure Created: ")

                                     }
                                 }
                             }) {
                                 Image("heart")
                                     .resizable()
                                     .frame(width: 20, height: 20)
                                     .padding(8)
                             },
                             alignment: .topTrailing
                         )

                         VStack(alignment: .leading, spacing: 4) {
                             Text(food.foodName)
                                 .font(.headline)
                                 .bold()
                                 .foregroundColor(.black)

                             Text(food.decription)
                                 .font(.subheadline)
                                 .foregroundColor(.gray)

                             HStack {
                                 Image("star")
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
                     .padding(10)
                     .onTapGesture {
                         // ✅ Save foodId locally using UserDefaults
                         UserDefaults.standard.set(food.foodId, forKey: "selectedFoodId")
                         
                     
                             navigateDetail = true
                         
                     }
                 }
             }
             .fullScreenCover(isPresented: $navigateDetail) {
                 FoodDetailView()
             }
         
    }

}

struct HomeView_View: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
