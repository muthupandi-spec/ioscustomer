import SwiftUI

struct FoodDetailView: View {
    @State private var foodCount: Int = 0
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = HomeviewModel()
    let foodId = UserDefaults.standard.integer(forKey: "selectedFoodId")

    var body: some View {
        NavigationStack{
            VStack(spacing: 16) {
                
                // Top bar with back button and restaurant name
                HStack(spacing: 12) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image("ic_back") // Replace with your back arrow asset
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    
                    Text("Food Detail")
                        .font(.system(size: 16, weight: .bold))
                    Spacer()
                }
                .padding()
                
                // Food Card
                VStack(alignment: .leading, spacing: 10) {
                    if let shop = viewModel.shopresponse {
                        HStack {
                            if let imageData = Data(base64Encoded: shop.image),
                               let uiImage = UIImage(data: imageData) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 100)
                                    .cornerRadius(8)
                            } else {
                                Image("ic_biryani")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 100)
                                    .cornerRadius(8)
                            }

                            VStack(alignment: .leading, spacing: 5) {
                                Text(shop.foodName)
                                    .font(.headline)
                                    .fontWeight(.bold)

                                Text("$\(shop.price)")
                                    .font(.subheadline)
                                    .fontWeight(.bold)

                                Text(shop.decription)
                                    .font(.caption)
                                    .foregroundColor(.gray)

                                HStack {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                    Text("4.2 | 4.5 reviews")
                                        .font(.caption)
                                        .foregroundColor(.black)
                                }
                            }

                            Spacer()

                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 14).fill(Color.white))
                        .shadow(radius: 2)
                    } else if viewModel.isLoading {
                        ProgressView("Loading...")
                    } else if let errorMessage = viewModel.errorMessage {
                        Text("Error: \(errorMessage)")
                            .foregroundColor(.red)
                    }
                }
                .padding(.horizontal)
                
                // Add/Remove Buttons
                if foodCount == 0 {
                    Button(action: {
                        foodCount = 1
                    }) {
                        Text("ADD")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .overlay(
                                RoundedRectangle(cornerRadius: 7)
                                    .stroke(Color("colorPrimary"), lineWidth: 1)
                            )
                    }
                    .padding(.horizontal)
                } else {
                    HStack(spacing: 16) {
                        Button(action: {
                            if foodCount > 0 { foodCount -= 1 }
                        }) {
                            Image(systemName: "minus")
                                .resizable()
                                .frame(width: 15, height:3)
                                .foregroundColor(.black)
                            
                            
                        }
                        
                        Text("\(foodCount)")
                            .font(.system(size: 13, weight: .bold))
                            .foregroundColor(Color("colorPrimary"))
                        
                        Button(action: {
                            foodCount += 1
                        }) {
                            Image("add")
                                .resizable()
                                .frame(width: 16, height: 16) // Adjust size as needed
                                .aspectRatio(contentMode: .fit)
                            
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(Color("colorPrimary"), lineWidth: 1)
                    )
                    .padding(.horizontal)
                }
                
                Spacer()
                
                // Bottom Buttons
                HStack(spacing: 16) {
                    Button("Add to cart") {
                        // Action here
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("colorPrimary"))
                    .foregroundColor(.white)
                    .cornerRadius(6)
                    
                    Button("View Cart") {
                        // Action here
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("colorPrimary"))
                    .foregroundColor(.white)
                    .cornerRadius(6)
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
            .background(Color.white.ignoresSafeArea())
            
        }
        .onAppear{
            viewModel.getshopid(shopid: foodId)
            
        }
    }
}
struct fooddetail_View: PreviewProvider {
    static var previews: some View {
        FoodDetailView()
    }
}
