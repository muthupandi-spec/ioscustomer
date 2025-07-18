import SwiftUI
import CountryPickerView

struct RegisterView: View {
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var selectedCountryCode: String = "+91"
    @State private var phoneNumber: String = ""
    @State private var selectedGender = "Male"
    @State private var firstname: String = ""
    @State private var lastname: String = ""
    @State private var city: String = ""
    @State private var adddress: String = ""
    @State private var date: String = ""
    @State private var email: String = ""
    @State private var showOTPDialog = false
    @State private var passsword: String = ""
    @State private var selectedDate = Date()
    @State private var navigateToLogin = false
    @State private var showDatePicker = false
    @StateObject private var viewModel = LoginViewModel()
    let genders = ["Male", "Female", "Others"]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    title
                    userinnpiut
                    countrycodephone
                    // Gender Selection
                    Text("Select Gender")
                        .font(.system(size: 18))
                        .bold()
                        .foregroundColor(.black)
                        .padding(.top)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    genderselection
                    // Sign Up Button
                   
                    Button(action: {
                        if validateFields() {
                            print("Sign Up Pressed ✅")
                            viewModel.register { result in
                                switch result {
                                case .success(let model):
                                    print("✅ Registered user ID: \(model.customerId)")
                                showOTPDialog=true
                                case .failure(let error):
                                    print("❌ Registration failed: \(error.localizedDescription)")
                                    showAlert = true
                                }
                            }

                        } else {
                            showAlert = true
                        }
                    }) {
                        Text("Sign Up")
                            .font(.headline)
                            .frame(maxWidth: .infinity, minHeight: 40)
                            .background(Color("colorPrimary"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal, 10)
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Validation Error"),
                            message: Text(alertMessage),
                            dismissButton: .default(Text("OK"))
                        )
                    }


                }
                .padding()
                .overlay(
                        Group {
                            if showOTPDialog {
                                OTPDialogView(
                                               isPresented: $showOTPDialog,
                                               phoneNumber: phoneNumber
                                           ) { enteredOtp in
                                               viewModel.otp = enteredOtp
                                               viewModel.verifyotp{
                                                 success in
                                                                           navigateToLogin = true
                                                                       
                                                   
                                               }
                                           }
                            }
                        }
                    )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented:
                                    $navigateToLogin) {
                LoginView()
            }
            .sheet(isPresented: $showDatePicker) {
                datepicker
                
            }
        }
    }
    private var genderselection:some View{
        HStack {
            ForEach(genders, id: \.self) { gender in
                Button(action: {
                    selectedGender = gender
                    viewModel.gender=gender
                }) {
                    HStack {
                        Image(systemName: selectedGender == gender ? "largecircle.fill.circle" : "circle")
                            .foregroundColor(.blue)
                        Text(gender)
                            .font(.system(size: 12))
                            .foregroundColor(.black)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }

    }
    private var countrycodephone:some View{
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
                .frame(maxWidth: .infinity).onAppear{
                    phoneNumber=viewModel.mobileno
                }
        }
        .frame(maxWidth: .infinity)
    }
    
    private var datepicker:some View{
        VStack {
            DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(.wheel)
                .labelsHidden()
                .padding()
            
            Button("Done") {
                let formatter = DateFormatter()
                formatter.dateFormat = "dd/MM/yyyy"
                date = formatter.string(from: selectedDate)
                viewModel.date=date
                showDatePicker = false
            }
            .padding()
        }
        
    }
    private var userinnpiut:some View{
        Group {
            TextField("Enter Your First Name", text:$viewModel.firstname)
            TextField("Enter Your Last Name", text:$viewModel.lastname)
            TextField("Enter Your City", text:$viewModel.city)
            TextField("Enter Your Address", text:$viewModel.address)
            
            Button(action: {
                showDatePicker.toggle()
            }) {
                HStack {
                    Text(date.isEmpty ? "Enter Your Date of Birth" : date)
                        .foregroundColor(date.isEmpty ? .gray : .black)
                    Spacer()
                    Image(systemName: "calendar")
                }
                
            }
            
            TextField("Enter Your Email", text:$viewModel.email)
            TextField("Enter Your Password", text:$viewModel.regiaterpassword)
        }
        .padding()
        .font(.system(size: 14))
        .background(Color.gray.opacity(0.2))
        .cornerRadius(5)
    }
    private var title:some  View{
        HStack {
            Button(action: {
                dismiss() // Go back
            }) {
                Image("ic_back")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            Text("Fill Your Profile")
                .font(.system(size: 18))
                .bold()
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 10)
        .padding(.horizontal)
        
    }
    private func validateFields() -> Bool {
        if viewModel.firstname.isEmpty {
            alertMessage = "Please enter your first name"
            return false
        }
        if viewModel.lastname.isEmpty {
            alertMessage = "Please enter your last name"
            return false
        }
        if viewModel.city.isEmpty {
            alertMessage = "Please enter your city"
            return false
        }
        if viewModel.address.isEmpty {
            alertMessage = "Please enter your address"
            return false
        }
        if date.isEmpty {
            alertMessage = "Please select your date of birth"
            return false
        }
        if viewModel.mobileno.isEmpty || viewModel.mobileno.count < 8 {
            alertMessage = "Please enter a valid mobile number"
            return false
        }
        if viewModel.email.isEmpty || !isValidEmail(viewModel.email) {
            alertMessage = "Please enter a valid email address"
            return false
        }
        if viewModel.regiaterpassword.isEmpty || viewModel.regiaterpassword.count < 6 {
            alertMessage = "Password must be at least 6 characters"
            return false
        }
        return true
    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return predicate.evaluate(with: email)
    }

    
}

// Custom Country Code Picker
struct CountryCodePicker: UIViewRepresentable {
    @Binding var selectedCode: String
    
    func makeUIView(context: Context) -> CountryPickerView {
        let countryPicker = CountryPickerView()
        countryPicker.delegate = context.coordinator
        countryPicker.showCountryCodeInView = false
        countryPicker.showPhoneCodeInView = true
        countryPicker.font = UIFont.systemFont(ofSize: 12)
        countryPicker.flagImageView?.frame = CGRect(x: 0, y: 0, width: 16, height: 12)
        return countryPicker
    }
    
    func updateUIView(_ uiView: CountryPickerView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, CountryPickerViewDelegate {
        var parent: CountryCodePicker
        
        init(_ parent: CountryCodePicker) {
            self.parent = parent
        }
        
        func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country) {
            parent.selectedCode = country.phoneCode
        }
    }
}

struct OTPDialogView: View {
    @Binding var isPresented: Bool
    @State private var otpText: String = ""
    var phoneNumber: String
    var onVerify: (String) -> Void  // ✅ Callback to trigger OTP verification

    var body: some View {
        ZStack {
            // Full-screen background with tap-to-dismiss
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture {
                    isPresented = false
                }
            
            VStack(spacing: 16) {
                Text("Enter OTP sent to \(phoneNumber)")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding()
                
                TextField("Enter OTP", text: $otpText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .padding(.horizontal)
                
                HStack(spacing: 10) {
                    Button(action: {
                        isPresented = false
                    }) {
                        Text("Cancel")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                    }
                    
                    Button(action: {
                        if otpText.isEmpty {
                            print("Please enter OTP") // Replace with a toast/snackbar
                        } else {
                            onVerify(otpText)         // ✅ Call the verify function
                                                
                            isPresented = false
                        }
                    }) {
                        Text("Submit")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .background(Color("colorPrimary"))
                            .cornerRadius(8)
                    }
                }
                .padding(.horizontal)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .frame(width: 300)
        }
    }
}

// Preview
struct Register_View: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
