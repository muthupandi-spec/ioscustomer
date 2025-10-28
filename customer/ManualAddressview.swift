import SwiftUI
import CoreLocation

struct ManualaddressView: View {
    @StateObject private var viewModel = HomeviewModel()
    @Environment(\.dismiss) var dismiss
    
    /// Called after successfully creating an address
    var onAddressCreated: (() -> Void)?
    
    @State private var errorMessage: String? = nil
    @State private var showPlaceSearch = false // show Google search view
    
    var body: some View {
        ZStack {
            VStack(spacing: 16) {
                
                // MARK: - Top Bar
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
                
                // MARK: - Address Form
                VStack(spacing: 12) {
                    CustomTextField(title: "Door No", text: $viewModel.doorNo)
                    CustomTextField(title: "Street", text: $viewModel.street)
                    CustomTextField(title: "Place", text: $viewModel.place)
                    CustomTextField(title: "City", text: $viewModel.cityy)
                    CustomTextField(title: "Pin Code", text: $viewModel.pincode, keyboardType: .numberPad)
                    
                    // MARK: - Landmark Button
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
                
                // MARK: - Error Message
                if let error = errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .font(.caption)
                        .padding(.horizontal)
                }
                
                // MARK: - Create Address Button
                Button(action: {
                    if validateForm() {
                        errorMessage = nil
                        viewModel.createAddress { result in
                            switch result {
                            case .success(let response):
                                print("✅ Address Created: \(response)")
                                onAddressCreated?()
                                DispatchQueue.main.async { dismiss() }
                            case .failure(let error):
                                print("❌ Address creation failed: \(error)")
                                DispatchQueue.main.async {
                                    errorMessage = error.localizedDescription
                                }
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
        }
        // MARK: - Place Search Sheet
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
    }
    
    // MARK: - Validation Logic
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

struct ManualaddressView_Previews: PreviewProvider {
    static var previews: some View {
        ManualaddressView()
    }
}

// MARK: - Reusable TextField
struct CustomTextField: View {
    var title: String
    @Binding var text: String
    var keyboardType: UIKeyboardType = .default

    var body: some View {
        TextField(title, text: $text)
            .padding(.horizontal, 10)
            .frame(height: 40)
            .background(RoundedRectangle(cornerRadius: 6).stroke(Color.gray.opacity(0.4)))
            .font(.system(size: 14))
            .keyboardType(keyboardType)
    }
}
