import SwiftUI

struct CompletedOrderView: View {
    var order: ActiveOrderResponsemodel
    @State private var showOrderDetails = false

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
                // Product Image
                if let base64String = order.orderItems.first?.product?.image,
                   let uiImage = decodeBase64ToUIImag(base64String)
                {
                    Image(uiImage: uiImage)
                        .resizable()
                        .frame(width: 80, height: 80)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } else {
                    Color.gray
                        .frame(width: 80, height: 80)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }

                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Order ID \(order.orderId)")
                            .font(.system(size: 13, weight: .bold))
                        Text("• \(order.orderItems.count) items")
                            .font(.system(size: 11))
                            .foregroundColor(.gray)
                    }

                    Text(order.orderItems.first?.product?.foodName ?? "")
                        .font(.system(size: 13, weight: .bold))
                        .lineLimit(1)

                    HStack {
                        Text("2.4 km") // Replace with actual distance if available
                            .font(.system(size: 11))
                        Divider()
                            .frame(height: 12)
                            .background(Color.gray)
                        Text("₹\(order.totalAmount, specifier: "%.2f")")
                            .font(.system(size: 13, weight: .bold))
                            .foregroundColor(.gray)
                    }

                    Text(order.orderStatus)
                        .font(.system(size: 9))
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Color.orange)
                        .cornerRadius(5)
                }
            }
            .padding()

            Divider()
                .padding(.horizontal)

            // Ratings
            HStack {
                VStack {
                    Text("Your Rating for Delivery")
                        .font(.system(size: 11))
                        .multilineTextAlignment(.center)
                    HStack {
                        Image("rating")
                            .resizable()
                            .frame(width: 16, height: 16)
                        Text("4.2")
                            .font(.system(size: 11))
                            .foregroundColor(.gray)
                    }
                }
                Spacer()
                VStack {
                    Text("Your Rating for Food")
                        .font(.system(size: 11))
                        .multilineTextAlignment(.center)
                    HStack {
                        Image("rating")
                            .resizable()
                            .frame(width: 16, height: 16)
                        Text("5.0")
                            .font(.system(size: 11))
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()

            // Button
            VStack(spacing: 10) {
                Button(action: {
                    showOrderDetails.toggle()
                }) {
                    Text("Order Completed")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }
                .sheet(isPresented: $showOrderDetails) {
                    OrderDetailpageView(order: order)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 2)
        .padding()
    }
}


struct Completedorder_View: View {
    @StateObject private var viewModel = HomeviewModel()

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                ForEach(viewModel.Activeorder) { order in
                    CompletedOrderView(order: order)
                }
            }
            .padding()
        }
        .onAppear {
            viewModel.completedorders()
        }
    }
}
func decodeBase64ToUIImag(_ base64String: String) -> UIImage? {
    if let imageData = Data(base64Encoded: base64String) {
        return UIImage(data: imageData)
    }
    return nil
}
struct CompletedOrderCardView_Previews: PreviewProvider {
    static var previews: some View {
        Completedorder_View()
        
    }
}
