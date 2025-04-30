import SwiftUI

struct CacelOrderView: View {
    var orderId: String // Dynamic Order ID
    @State private var showOrderDetails = false // Controls sheet visibility
    @StateObject private var viewModel = HomeviewModel()
    @State private var hasAppeared = false

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
                // Food Image
                Image("ic_bir")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 10))

                VStack(alignment: .leading, spacing: 4) {
                    // Order ID
                    HStack {
                        Text("Order ID \(orderId)")
                            .font(.system(size: 13, weight: .bold))
                        Text("• 3 items")
                            .font(.system(size: 11))
                            .foregroundColor(.gray)
                    }

                    // Food Name
                    Text("Big Grand Salad")
                        .font(.system(size: 13, weight: .bold))
                        .lineLimit(1)

                    // Distance and Cost
                    HStack {
                        Text("2.4 km")
                            .font(.system(size: 11))
                        Divider()
                            .frame(height: 12)
                            .background(Color.gray)
                        Text("$42.22")
                            .font(.system(size: 13, weight: .bold))
                            .foregroundColor(.gray)
                    }

                    // Order Status
                    Text("Paid")
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

            // Ratings Section
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

            Divider()
                .padding(.horizontal)

            // Buttons
            VStack(spacing: 10) {
                Button(action: {
                    showOrderDetails.toggle() // Open sheet on button tap
                }) {
                    Text("Cacelled")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }
                .sheet(isPresented: $showOrderDetails) {
                    OrderDetailpageView() // Pass orderId to sheet
                }

            }
            .padding(.horizontal)
            .padding(.bottom, 10)
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 2)
        .padding()
        .onAppear{
            if !hasAppeared {
                       viewModel.cancelorders()
                       hasAppeared = true
                   }
            
        }
    }
}

struct Cacelorder_View: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                ForEach(1...5, id: \.self) { index in
                    CacelOrderView(orderId: "#000\(index)")
                }
            }
            .padding()
        }
    }
}

struct cancelOrderCardView_Previews: PreviewProvider {
    static var previews: some View {
        Cacelorder_View()
        
    }
}
