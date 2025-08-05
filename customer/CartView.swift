import SwiftUI

struct CartView: View {
    @StateObject private var viewModel = HomeviewModel()
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 0) {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let errorMessage = viewModel.errorMessage {
//                    Text("Error: \(errorMessage)")
//                        .foregroundColor(.red)
                    header
                    productview
                    button
                } else {
                    header
                    productview
                    button
                    
                }
                
            }
            .edgesIgnoringSafeArea(.bottom)
        }.onAppear {
            viewModel.getcartitem(customerId:  UserDefaults.standard.integer(forKey: "customerID") )
            
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
            Text("My Cart")
                .font(.system(size: 18))
                .bold()
                .padding(.horizontal, 30)
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 10)
        .padding(.horizontal)
    }
    private var productview:some View{
        ScrollView {
            VStack(spacing: 10) {
                ForEach(viewModel.cartresponse) { cart in
                    ForEach(cart.cartItems.indices, id: \.self) { index in
                        let item = cart.cartItems[index]
                        
                        ZStack(alignment: .topTrailing) {
                            HStack(spacing: 10) {
                                // Image
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.white)
                                        .frame(width: 75, height: 75)
                                        .shadow(radius: 1)

                                    if let imageData = Data(base64Encoded: item.product.image),
                                       let uiImage = UIImage(data: imageData) {
                                        Image(uiImage: uiImage)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 75, height: 75)
                                            .clipShape(RoundedRectangle(cornerRadius: 15))
                                    } else {
                                        Image("placeholder_image")
                                            .resizable()
                                            .frame(width: 75, height: 75)
                                            .clipShape(RoundedRectangle(cornerRadius: 15))
                                    }
                                }

                                // Details
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(item.product.foodName)
                                        .font(.system(size: 14, weight: .bold))
                                        .foregroundColor(.black)

                                    Text("\(item.quantity) item")
                                        .font(.system(size: 12))
                                        .foregroundColor(.gray)

                                    Text("₹\(item.subTotal, specifier: "%.2f")")
                                        .font(.system(size: 14, weight: .bold))
                                        .foregroundColor(.blue)
                                }

                                Spacer()

                                Image("heart_selector")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .opacity(0.5)
                            }
                            .padding(10)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.white)
                                    .shadow(radius: 2)
                            )
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)

                            // 🗑️ Delete Button
                            Button(action: {
                                print("🗑️ Delete tapped for foodId: \(item.product.foodId)")
                                // Call your delete API or local removal logic here
                                // viewModel.deleteItem(cartId: cart.id, foodId: item.product.foodId)
                                
                                viewModel.deletecart(customerId:  UserDefaults.standard.integer(forKey: "customerID"), foodid: item.product.foodId) { success in
                                    if success {
                                        viewModel.getcartitem(customerId: UserDefaults.standard.integer(forKey: "customerID"))
                                    }
                                }
    
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                                    .padding(18)
                            }
                        }
                    }
                }
                        }
            .padding(.bottom, 60) // Ensure button is not overlapped when scrolling
        }.padding(.horizontal,10).padding(.vertical,20)
    }
    private var button:some View{
        VStack {
            Button(action: {
                print("Move to Cart Pressed")
            }) {
                Text("Move to Cart")
                    .font(.headline)
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(Color("colorPrimary"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 10)
            .padding(.bottom, 20) // Adds spacing from bottom
        }
        .background(Color.white)
    }
}



struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
