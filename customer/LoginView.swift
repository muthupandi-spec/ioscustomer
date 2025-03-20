import SwiftUI
import CountryPickerView

struct LoginView: View {
    @State private var selectedCountryCode: String = "+91"
    @State private var phoneNumber: String = ""
    
    
    var body: some View {
        ZStack {
            Color("colorPrimary") // Background color
                .ignoresSafeArea()
            
            VStack {
                // Logo and Title
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
                
                // White Curved Background
                VStack(spacing: 20) {
                    Image("ic_logo")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .padding(.top, 30)
                    
                    HStack {
                        
                        CountryCodePicker(selectedCode: $selectedCountryCode)
                            .frame(width: 80, height: 50)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(5)
                        
                        // Mobile Number Input
                        TextField("Enter Mobile Number", text: .constant(""))
                            .padding()
                            .keyboardType(.numberPad)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(5)
                    }
                    .padding(.horizontal, 10)
                    
                    Divider()
                    
                    // Login Button
                    Button(action: {
                        print("Sign In Pressed")
                    }) {
                        Text("Sign In")
                            .font(.headline)
                            .frame(maxWidth: .infinity, minHeight: 40)
                            .background(Color("colorPrimary"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal, 10)
                    
                    HStack {
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.gray)
                        
                        Text("or continue with")
                            .font(.footnote)
                            .foregroundColor(.gray)
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 20)
                    
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
                    
                    Text("Sign Up")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .padding(.top, 10)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.white)
                        .edgesIgnoringSafeArea(.bottom)
                )
            }
            
            // Loader Animation
            
        }
    }
    // Wrapper for CountryPickerView in SwiftUI
    struct CountryCodePicker: UIViewRepresentable {
        @Binding var selectedCode: String
        
        init(selectedCode: Binding<String>) { // Explicit initializer
            self._selectedCode = selectedCode
        }
        
        func makeUIView(context: Context) -> CountryPickerView {
            let countryPicker = CountryPickerView()
               countryPicker.delegate = context.coordinator
               countryPicker.showCountryCodeInView = false // Hide country name
               countryPicker.showPhoneCodeInView = true
            countryPicker.font = UIFont.systemFont(ofSize: 12) // Smaller font
               countryPicker.flagImageView?.frame = CGRect(x: 0, y: 0, width: 16, height: 12) // Reduce flag sizef`
            // Show only country code
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
}
