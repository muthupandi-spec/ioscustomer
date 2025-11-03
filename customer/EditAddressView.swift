import SwiftUI

struct EditaddressView: View {
    var address: GetAddressResponseModelItem
    @ObservedObject var viewModel: HomeviewModel
    var onAddressCreated: (() -> Void)?   // ✅ callback
    @State private var showPlaceSearch = false // show Google search view

    @Environment(\.dismiss) var dismiss
    @State private var showLoader = false
    @State private var errorMessage: String? = nil

    var body: some View {
        ZStack {
            VStack(spacing: 16) {
                // Top Bar
                HStack {
                    Button(action: { dismiss() }) {
                        Image("ic_back")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    
                    Text("Address")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.black)
                        .padding(.leading, 10)
                    
                    Spacer()
                }
                .padding(.top, 10)
                .padding(.horizontal)
                
                // Form
                VStack(spacing: 12) {
                    CustomTextField(title: "Door No", text: $viewModel.doorNo)
                    CustomTextField(title: "Street", text: $viewModel.street)
                    CustomTextField(title: "Place", text: $viewModel.place)
                    CustomTextField(title: "City", text: $viewModel.cityy)
                    CustomTextField(title: "Pin Code", text: $viewModel.pincode, keyboardType: .numberPad)
                    Button(action: { showPlaceSearch = true }) {
                        HStack {
                            Text(viewModel.landmark.isEmpty ? "Select Landmark" : viewModel.landmark)
                                .foregroundColor(viewModel.landmark.isEmpty ? .gray : .black)
                            Spacer()
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal, 10)
                        .frame(height: 40)
                        .background(RoundedRectangle(cornerRadius: 6).stroke(Color.gray.opacity(0.4)))
                        .font(.system(size: 14))
                    }
                }
                .padding(.horizontal)
                
                if let error = errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .font(.caption)
                        .padding(.horizontal)
                }
                
                Button(action: {
                    if validateForm() {
                        showLoader = true
                        errorMessage = nil
                        viewModel.updateAddress { result in
                            showLoader = false
                            switch result {
                            case .success(let response):
                                print("✅ Address Created: \(response.addressId)")
                                viewModel.addressid = response.addressId
                                dismiss()
                                onAddressCreated?()
                            case .failure(let error):
                                errorMessage = error.localizedDescription
                            }
                        }
                    }
                }) {
                    Text("Create Address")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(Color("colorPrimary"))
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                .padding(.bottom, 10)
                
                Spacer()
            }
            .background(Color.white.ignoresSafeArea())
            .sheet(isPresented: $showPlaceSearch) {
                PlaceSearchView { name, coordinate in
                    if let coordinate = coordinate {
                        viewModel.landmark = name
                        viewModel.latitude = coordinate.latitude
                        viewModel.longitude = coordinate.longitude
                    } else {
                        viewModel.landmark = name
                    }
                }
            }
            .onAppear {
                viewModel.addressid = address.addressId
                viewModel.doorNo = address.doorNo
                viewModel.street = address.street
                viewModel.place = address.city
                viewModel.cityy = address.city
                viewModel.pincode = String(address.pincode)
                viewModel.landmark = address.landMark
            }
            
            // Loader overlay
            if showLoader {
                ProgressView("Please wait...")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
        }
    }

    func validateForm() -> Bool {
        if viewModel.doorNo.isEmpty ||
            viewModel.street.isEmpty ||
            viewModel.place.isEmpty ||
            viewModel.cityy.isEmpty ||
            viewModel.pincode.isEmpty ||
            viewModel.landmark.isEmpty {
            errorMessage = "Please fill in all the fields."
            return false
        }

        if viewModel.pincode.count != 6 || Int(viewModel.pincode) == nil {
            errorMessage = "Please enter a valid 6-digit Pin Code."
            return false
        }

        return true
    }
}
