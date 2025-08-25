import SwiftUI

struct AddressView: View {
    @State private var navigate_addaddress = false
    @State private var selectedAddress: GetAddressResponseModelItem? = nil   // For selection only
    @State private var editAddress: GetAddressResponseModelItem? = nil       // For editing

    @State private var selectedAddressId: Int? = nil
    @State private var errorMessage: String?
    @State private var isLoading = false

    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = HomeviewModel()

    var body: some View {
        NavigationStack {
            VStack {
                header
                Divider()

                // Address List
                if viewModel.addressresponse.isEmpty {
                    // ✅ No addresses → set default value 0
                    Text("No address found")
                        .foregroundColor(.gray)
                        .padding()
                        .onAppear {
                            UserDefaults.standard.set(0, forKey: "selectedAddressId")
                        }
                } else {
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

                                            // ✅ Use editAddress for editing flow
                                            Button(action: {
                                                editAddress = address
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
                                            .fixedSize(horizontal: false, vertical: true)

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

                                        // ✅ Radio Circle (Selection Only — No Edit Trigger)
                                        Button(action: {
                                            selectedAddressId = address.addressId
                                            UserDefaults.standard.set(address.addressId, forKey: "selectedAddressId")
                                            selectedAddress = address
                                            dismiss()   // Just dismiss, don’t open edit
                                        }) {
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
                                        .buttonStyle(PlainButtonStyle())
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
                }

                Spacer()
                button
            }
            .navigationBarBackButtonHidden(true)

            // Add New Address
            .fullScreenCover(isPresented: $navigate_addaddress, onDismiss: {
                viewModel.getaddress(customerId: UserDefaults.standard.integer(forKey: "customerID"))
            }) {
                ManualaddressView()
            }

            // Edit Address (only opens when "EDIT" button clicked)
            .fullScreenCover(item: $editAddress, onDismiss: {
                viewModel.getaddress(customerId: UserDefaults.standard.integer(forKey: "customerID"))
            }) { selected in
                EditaddressView(address: selected, viewModel: viewModel)
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
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 20)
    }
}
