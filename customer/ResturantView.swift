import SwiftUI

struct RestaurantView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = HomeviewModel()
    @State private var selectedChip: RestaurantCategoriesResponseModelItemm? = nil
    @State private var navigateDetail = false
    @State private var isVeg = false
    @State private var isNonVeg = false
    @AppStorage("selectedRestaurantId") var selectedRestaurantId: Int = 0

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
                        type
                        chipSelectionView
                        foodListView
                    } else {
                        header
                        type
                        chipSelectionView
                        foodListView
                
                    }
                    
                }
                .edgesIgnoringSafeArea(.bottom)
            }.onAppear {
                viewModel.getrestauerantcategory(categoryId: selectedRestaurantId )
                
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


    private var type: some View {
        HStack {
            Text("Veg")
                .font(.system(size: 13))
            
            Toggle("", isOn: Binding(
                get: { isVeg },
                set: { newValue in
                    isVeg = newValue
                    if newValue {
                        isNonVeg = false
                        viewModel.productchannge(resid:selectedRestaurantId,type: "veg")
                    } else {
                    }
                }
            ))
            .labelsHidden()
            .toggleStyle(SwitchToggleStyle(tint: Color.green))
            
            Spacer().frame(width: 24)
            
            Text("Non-Veg")
                .font(.system(size: 13))
            
            Toggle("", isOn: Binding(
                get: { isNonVeg },
                set: { newValue in
                    isNonVeg = newValue
                    if newValue {
                        isVeg = false
                        viewModel.productchannge(resid:selectedRestaurantId,type: "nonveg")
                    } else {
                    }
                }
            ))
            .labelsHidden()
            .toggleStyle(SwitchToggleStyle(tint: Color.red))
        }
        .padding(.horizontal, 18)
    }

    private var chipSelectionView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(viewModel.restauratcategory) { chip in
                    Text(chip.restaurantCatagory) // ✅ Correct property
                        .foregroundColor(selectedChip?.restaurantCatagoryId == chip.restaurantCatagoryId ? .white : Color("colorPrimary"))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(
                            Capsule()
                                .fill(selectedChip?.restaurantCatagoryId == chip.restaurantCatagoryId ? Color("colorPrimary") : Color.clear)
                        )
                        .overlay(
                            Capsule()
                                .stroke(Color("colorPrimary"), lineWidth: 1)
                        )
                        .onTapGesture {
                            selectedChip = chip
                            viewModel.getrestCategoryid(categoryId: String(chip.restaurantCatagoryId))
                        }
                }
            }
            .padding(.horizontal, 10)
        }
        .onAppear {
            if selectedChip == nil, let firstChip = viewModel.restauratcategory.first {
                selectedChip = firstChip
                viewModel.getrestCategoryid(categoryId: String(firstChip.restaurantCatagoryId))
            }
        }
    }
    private var foodListView: some View {
        ScrollView {
                 ForEach(Array(viewModel.restauratfood.enumerated()), id: \.element.foodId) { index, food in
                     HStack {
                         ZStack(alignment: .bottomLeading) {
                             if let imageBase64 = food.image,
                                   let imageData = Data(base64Encoded: imageBase64),
                                   let uiImage = UIImage(data: imageData) {
                                    
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 200, height: 150) // Adjust as needed
                                        .clipped()
                                } else {
                                    // Optional fallback image or placeholder
                                    Color.gray
                                        .frame(width: 200, height: 150)
                                        .overlay(Text("No Image").foregroundColor(.white))
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
                 FoodDetailView()
             }
         
    }


}
