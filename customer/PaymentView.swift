import SwiftUI

struct PaymentView: View {
    @State private var selectedPaymentMethod: String? = nil

    let paymentMethods: [(image: String, name: String, price: String)] = [
        ("wallet", "Wallet", "$50"),
        ("credit-card", "Credit Card", "$45"),
        ("credit-card", "Razorpay", "$48")
    ]

    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    // Header with Back Button
                    HStack {
                        Image("ic_back")
                            .resizable()
                            .frame(width: 23, height: 23)

                        Text("Payment Type")
                            .font(.system(size: 18))
                            .bold()
                            .foregroundColor(.black)

                        Spacer() // Pushes text to the left
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.top, 10)

                    // Payment Methods List
                    ForEach(paymentMethods, id: \.name) { method in
                        HStack {
                            Image(method.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)

                            Text(method.name)
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(.black)

                            Spacer() // Pushes price to the right

                            Text(method.price)
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(.black)

                            Button(action: {
                                selectedPaymentMethod = method.name
                            }) {
                                Image(systemName: selectedPaymentMethod == method.name ? "largecircle.fill.circle" : "circle")
                                    .foregroundColor(selectedPaymentMethod == method.name ? Color("colorPrimary") : .gray)
                                    .font(.system(size: 20))
                            }
                            .padding(.trailing, 20)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 16)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .stroke(selectedPaymentMethod == method.name ? Color ("colorPrimary"): Color.gray, lineWidth: 1))
                        .padding(.horizontal, 16)

                    }
                }
            }
        }
    }
}

// Preview
struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}
