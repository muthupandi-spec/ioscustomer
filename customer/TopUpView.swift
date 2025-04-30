import SwiftUI

struct TopUpView: View {
    let gridItems = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    let topUpAmounts = ["$10", "$20", "$50", "$100", "$200", "$500", "$1000", "$2000"]
    @StateObject private var viewModel = HomeviewModel()

    @State private var amount: String = "0$"
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            VStack {
                // Custom Header
                HStack {
                    Button(action: {
                        dismiss() // Go back
                    }) {
                        Image("ic_back")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }

                    Text("Top Up E-Wallet")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .bold))

                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 10)

                Text("Enter the amount of top up")
                    .font(.system(size: 12))
                    .foregroundColor(.black)
                    .padding(.top, 15)

                TextField("", text: $amount)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 30, weight: .bold))
                    .frame(height: 80)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
                    .padding(.horizontal)
                    .disabled(true) // Prevent manual input

                LazyVGrid(columns: gridItems, spacing: 10) {
                    ForEach(topUpAmounts, id: \.self) { value in
                        Button(action: {
                            amount = value // Update amount
                        }) {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray.opacity(0.3))
                                .frame(height: 50)
                                .overlay(
                                    Text(value)
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .bold))
                                )
                        }
                    }
                }
                .padding(.top, 20)
                .padding(.horizontal)

                Spacer()

                Button(action: {
                    // Handle continue button action
                }) {
                    Text("Continue")
                        .font(.system(size: 13))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 40)
                        .background(Color("colorPrimary"))
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
            .navigationBarBackButtonHidden(true) // ✅ Hides the system back button
        }.onAppear{
            viewModel.topupwallet(topup: amount)
        }
    }
}

struct TopUpView_Previews: PreviewProvider {
    static var previews: some View {
        TopUpView()
    }
}
