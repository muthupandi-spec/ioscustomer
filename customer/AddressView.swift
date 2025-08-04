import SwiftUI

struct AddressView: View {
    @State private var navigate_addaddress = false
    @State private var navigate_editaddress = false
    @State private var selectedAddress: GetAddressResponseModelItem? = nil

    @State private var selectedAddressId: Int? = nil
    @State private var errorMessage: String?
    @State private var isLoading = false

    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = HomeviewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    header
                    Divider()

                    // Address List
                    ForEach(viewModel.addressresponse, id: \.addressId) { address in
                        Button(action: {
                            selectedAddressId = address.addressId
                            UserDefaults.standard.set(address.addressId, forKey: "selectedAddressId")
                            selectedAddress = address
                        }) {
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

                                            Button(action: {
                                                selectedAddress = address
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                                    navigate_editaddress = true
                                                }
                                            }) {
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
                                        }

                                        Text("\(address.doorNo), \(address.street), \(address.city)")
                                            .font(.system(size: 10))
                                            .fixedSize(horizontal: false, vertical: true) // Allows multiline

                                        Text("\(address.pincode)")
                                            .font(.system(size: 10))
                                            .fixedSize(horizontal: false, vertical: true)
                                    }

                                    Spacer()

                                    VStack {
                                        // Delete Button
                                        Button(action: {
                                            viewModel.deleteadress(addressid: address.addressId) { success in
                                                if success {
                                                    viewModel.getaddress(customerId: UserDefaults.standard.integer(forKey: "customerID"))
                                                }
                                            }
                                        }) {
                                            Image(systemName: "trash.fill")
                                                .foregroundColor(.red)
                                                .padding(6)
                                        }
                                        .buttonStyle(PlainButtonStyle())


                                        // Radio Circle
                                        Circle()
                                            .strokeBorder(
                                                selectedAddressId == address.addressId ? Color.green : Color.gray,
                                                lineWidth: 2
                                            )
                                            .background(
                                                Circle().fill(
                                                    selectedAddressId == address.addressId ? Color.green : Color.white
                                                )
                                            )
                                            .frame(width: 20, height: 20)
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 12)
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.white)
                                    .shadow(color: .gray.opacity(0.2), radius: 1, x: 0, y: 1)
                            )
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }


                    Spacer()
                    button
                }
                .background(Color.white.edgesIgnoringSafeArea(.all))
            }
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $navigate_addaddress) {
                ManualaddressView()
            }
            .navigationDestination(isPresented: $navigate_editaddress) {
                Group {
                    if let selected = selectedAddress {
                        EditaddressView(address: selected, viewModel: viewModel)
                    } else {
                        EmptyView() // Fallback view
                    }
                }
            }
        }
        .onAppear {
            viewModel.getaddress(customerId: UserDefaults.standard.integer(forKey: "customerID"))
        }
    }

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

            Button(action: {
                // Handle Apply with selectedAddressId
                if let id = selectedAddressId {
                    print("Selected Address ID: \(id)")
                    // You can now use it to apply selection
                }
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
