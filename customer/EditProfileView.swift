import SwiftUI
import CountryPickerView

struct EditProfileView: View {
    @State private var selectedCountryCode: String = "+91"
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = HomeviewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    title
                    userInputFields
                    countryCodePhoneView
                    
                    Button(action: {
                        print("Update Profile Pressed")
                        viewModel.updateprofile(){ result in
                            switch result {
                            case .success(let model):
                                print("✅ Registered user ID: \(model.customerId)")
                                UserDefaults.standard.set(model.lastName, forKey: "userLastName")
                                UserDefaults.standard.set(model.email, forKey: "userEmail")
                                UserDefaults.standard.set(model.mobileNumber, forKey: "mobileNo")
                            case .failure(let error):
                                print("❌ Registration failed: \(error.localizedDescription)")
                            }
                        }
                    }) {
                        Text("Update Profile")
                            .font(.headline)
                            .frame(maxWidth: .infinity, minHeight: 40)
                            .background(Color("colorPrimary"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal, 10)
                }
                .padding()
            }
            .navigationBarBackButtonHidden(true)
        }
    }

    private var countryCodePhoneView: some View {
        HStack {
            CountryCodePicker(selectedCode: $selectedCountryCode)
                .frame(width: 80, height: 50)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)

            TextField("Enter Mobile Number", text: $viewModel.mobileno)
                .padding()
                .keyboardType(.numberPad)
                .font(.system(size: 14))
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity)
    }

    private var userInputFields: some View {
        Group {
            TextField("Enter Your First Name", text: $viewModel.firstname)
            TextField("Enter Your Last Name", text: $viewModel.lastname)
            TextField("Enter Your Email", text: $viewModel.email)
            TextField("Enter Your Password", text: $viewModel.password)
        }
        .padding()
        .font(.system(size: 14))
        .background(Color.gray.opacity(0.2))
        .cornerRadius(5)
    }

    private var title: some View {
        HStack {
            Button(action: {
                dismiss()
            }) {
                Image("ic_back")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            Text("Edit Profile")
                .font(.system(size: 18))
                .bold()
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 10)
        .padding(.horizontal)
    }

    struct Profile_view: PreviewProvider {
        static var previews: some View {
            EditProfileView()
        }
    }
}
