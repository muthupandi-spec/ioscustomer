import SwiftUI
import CountryPickerView

struct LoginView: View {
    @State private var selectedCountryCode: String = "+91"
    @State private var phoneNumber: String = "9787485161"
    @State private var showDialog = false
    @State private var goToHome = false
    @State private var goToRegister = false
    @State private var navigateToHome = false // State variable for navigation
    @State private var navigateregister = false // State variable for navigation
    @State private var mobileNumber: String = ""
    
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color("colorPrimary") // Background color
                    .ignoresSafeArea()
            
                headerview
                if showDialog {
                    OTPDialogView(isPresented: $showDialog, phoneNumber: phoneNumber) { otp in
                        if phoneNumber == "9787485161" {
                            goToHome = true
                            
                            print("Verify OTP: \(otp)")
                            // Navigate to Home screen
                        } else {
                            print("Navigate to Register screen")
                        }
                    }
                    .transition(.opacity)
                }
            }.navigationDestination(isPresented: $goToHome) {
                RegisterView()
            }
            .navigationDestination(isPresented: $goToRegister) {
                RegisterView()
            }
            
        }.navigationTitle("login")
        
    }
    
    
    
    
    
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
        var onVerify: (String) -> Void
        
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
                                onVerify(otpText)
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
    
    
    private var headerview: some View {
           VStack {
               // Header
               Text("Login to Your Account")
                   .font(.title)
                   .bold()
                   .foregroundColor(.white)
                   .padding(.top, 10)

               Image("burger")
                   .resizable()
                   .frame(width: 150, height: 150)
                   .padding(.top, 20)

               Spacer()

               // Curved White Container
               VStack(spacing: 20) {
                   Image("ic_logo")
                       .resizable()
                       .frame(width: 60, height: 60)
                       .padding(.top, 30)

                   VStack(spacing: 10) {
                       TextField("Enter your email address", text: $viewModel.email)
                           .padding()
                           .keyboardType(.emailAddress)
                           .autocapitalization(.none)
                           .background(Color.gray.opacity(0.2))
                           .cornerRadius(5)

                       SecureField("Enter your password", text: $viewModel.password)
                           .padding()
                           .background(Color.gray.opacity(0.2))
                           .cornerRadius(5)
                   }
                   .padding(.horizontal, 10)

                   if let error = viewModel.errorMessage {
                       Text(error)
                           .foregroundColor(.red)
                           .font(.caption)
                   }

                   if viewModel.isLoading {
                       ProgressView()
                           .padding(.top, 4)
                   }

                       Button(action: {
                           viewModel.login { result in
                               switch result {
                               case .success(let loginResponse):
                                   // ✅ Access loginResponse data here
                                   print("✅ Token: \(loginResponse.accessToken)")
                                   print("✅ Username: \(loginResponse.username)")
                                   print("✅ Email: \(loginResponse.email)")
                                   print("✅customeridail: \(loginResponse.customerId)")
                                   UserDefaults.standard.set(loginResponse.customerId, forKey: "customerID")
                                   // Example: Save token
                                   UserDefaults.standard.set(loginResponse.accessToken, forKey: "authToken")

                                   navigateToHome = true

                               case .failure(let error):
                                   print("❌ Login failed: \(error.localizedDescription)")
                               }
                           }

                       }) {
                           Text("Sign In")
                               .font(.headline)
                               .frame(maxWidth: .infinity, minHeight: 44)
                               .background(Color("colorPrimary"))
                               .foregroundColor(.white)
                               .cornerRadius(10)
                       }
                       .padding(.horizontal, 10)

                   NavigationLink("", destination: HomePageView(), isActive: $navigateToHome)
                       .hidden()

                   // OR Divider
                   HStack {
                       Rectangle()
                           .frame(height: 1)
                           .foregroundColor(.gray)

                       Text("or continue with")
                           .font(.footnote)
                           .foregroundColor(.gray)

                       Rectangle()
                           .frame(height: 1)
                           .foregroundColor(.gray)
                   }
                   .padding(.horizontal, 20)

                   // Social buttons
                   HStack(spacing: 30) {
                       Image("fb_logo")
                           .resizable()
                           .frame(width: 25, height: 25)
                           .padding()
                           .background(Color.white)
                           .cornerRadius(10)
                           .shadow(radius: 2)

                       Image("google")
                           .resizable()
                           .frame(width: 25, height: 25)
                           .padding()
                           .background(Color.white)
                           .cornerRadius(10)
                           .shadow(radius: 2)
                   }
                   .padding(.top, 10)

                   // Sign Up
                   Button(action: {
                       navigateregister = true
                   }) {
                       Text("Don't have an account? Sign Up")
                           .font(.footnote)
                           .foregroundColor(.gray)
                           .padding(.top, 10)
                   }
                   .navigationDestination(isPresented: $navigateregister) {
                       RegisterView()
                   }

                   Spacer()
               }
               .frame(maxWidth: .infinity)
               .background(
                   RoundedRectangle(cornerRadius: 30)
                       .fill(Color.white)
                       .edgesIgnoringSafeArea(.bottom)
               )
           }
       }
  
    
    struct login_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
        }
    }
    
}
