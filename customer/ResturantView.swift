import SwiftUI

struct RestaurantView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = HomeviewModel()
    @State private var selectedChip: CategoriesResponseModelItem? = nil
    @State private var navigateDetail = false

    var body: some View {
        NavigationStack{
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading) {
                    if viewModel.isLoading {
                        ProgressView("Loading...")
                    } else if let errorMessage = viewModel.errorMessage {
                        //                    Text("Error: \(errorMessage)")
                        //                        .foregroundColor(.red)
                        header
                        chipSelectionView
                        foodListView
                    } else {
                        header
                        chipSelectionView
                        foodListView
                        
                    }
                    
                }
                .edgesIgnoringSafeArea(.bottom)
            }.onAppear {
                viewModel.getcartitem(customerId: 4 )
                
            }
        }
    }
    private var header:some View
    {
        HStack {
            Button(action: {
                dismiss() // 👈 Dismiss the current view
            }) {
                Image("ic_back")
                    .resizable()
                    .frame(width: 23, height: 23)
            }
            Text("Restaurat")
                .font(.system(size: 18))
                .bold()
                .padding(.horizontal, 30)
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 10)
        .padding(.horizontal)
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
        .onAppear {
            // Preselect first chip and call API
            if selectedChip == nil, let firstChip = viewModel.categoriew.first {
                selectedChip = firstChip
                viewModel.getCategoryid(categoryId: String(firstChip.categoryId))
            }
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
                                 viewModel.addcart(customerId: 4, foodid: food.foodId, quatity: 1)
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
                 ShopDetailView()
             }
         
    }


}
