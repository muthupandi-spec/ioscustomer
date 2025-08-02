import SwiftUI

struct AddressView: View {
    @State private var navigate_addaddress = false
    @State private var errorMessage: String?
    @State private var isLoading = false

    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = HomeviewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    // Header Section
                    header
                    Divider()

                    // Address List
                   
                    ForEach(viewModel.addressresponse, id: \.addressId) { address in
                                VStack {
                                    HStack(alignment: .top, spacing: 12) {
                                        Image(systemName: "location.fill")
                                            .resizable()
                                            .frame(width: 28, height: 28)
                                            .padding(.vertical, 10)

                                        VStack(alignment: .leading, spacing: 6) {
                                            HStack {
                                                Text("Home")
                                                    .font(.system(size: 11, weight: .bold))
                                                    .foregroundColor(.black)

                                                Text("EDIT")
                                                    .font(.system(size: 9))
                                                    .padding(.vertical, 3)
                                                    .padding(.horizontal, 10)
                                                    .background(
                                                        RoundedRectangle(cornerRadius: 4)
                                                            .stroke(Color.black, lineWidth: 1)
                                                    )
                                                    .foregroundColor(.gray)
                                            }

                                            Text("\(address.doorNo), \(address.street), \(address.city)")
                                                .font(.system(size: 10))
                                                .lineLimit(1)

                                            Text("\(address.pincode)")
                                                .font(.system(size: 10))
                                                .lineLimit(1)
                                        }

                                        Spacer()

                                        Circle()
                                            .strokeBorder(Color.green, lineWidth: 2)
                                            .background(Circle().fill(Color.white))
                                            .frame(width: 20, height: 20)
                                    }
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 12)
                                }
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.white)
                                        .shadow(color: .gray.opacity(0.2), radius: 1, x: 0, y: 1)
                                )
                                .padding(.horizontal, 4)
                                .padding(.vertical, 8)
                            }
                        
                    

                    Spacer()
                    button
                }
                .background(Color.white.edgesIgnoringSafeArea(.all))
            }
            .navigationBarBackButtonHidden(true)
        }
        .onAppear {
            viewModel.getaddress(customerId: UserDefaults.standard.integer(forKey: "customerID"))
        }
    }

    // MARK: - Header View
    private var header: some View {
        HStack {
            Button(action: {
                dismiss()
            }) {
                Image("ic_back")
                    .resizable()
                    .frame(width: 20, height: 20)
            }

            Text("Address")
                .font(.headline)
                .foregroundColor(.black)

            Spacer()

            Image("edit")
                .resizable()
                .frame(width: 20, height: 20)
                .opacity(0)
        }
        .padding(.horizontal, 16)
        .padding(.top, 20)
    }

    // MARK: - Bottom Button View
    private var button: some View {
        VStack(spacing: 12) {
            Button(action: {
                navigate_addaddress = true
            }) {
                Text("Add New Address")
                    .frame(maxWidth: .infinity, minHeight: 40)
                    .background(Color.gray.opacity(0.2))
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            .navigationDestination(isPresented: $navigate_addaddress) {
                ManualaddressView()
            }

            Button(action: {
                // Handle Apply
            }) {
                Text("Apply")
                    .frame(maxWidth: .infinity, minHeight: 40)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 20)
    }

   
}

