import SwiftUI
import CountryPickerView

struct RegisterView: View {
    
    @State private var selectedCountryCode: String = "+91"
    @State private var phoneNumber: String = ""
    @State private var selectedGender = "Male"
    @State private var firstname: String = ""
    @State private var lastname: String = ""
    @State private var city: String = ""
    @State private var adddress: String = ""
    @State private var date: String = ""
    @State private var email: String = ""
    @State private var passsword: String = ""
    @State private var selectedDate = Date()
    @State private var showDatePicker = false
    
    let genders = ["Male", "Female", "Others"]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    // Title & Back Button
                    HStack {
                        Image("ic_back")
                            .resizable()
                            .frame(width: 23, height: 23)
                        
                        Text("Fill Your Profile")
                            .font(.system(size: 18))
                            .bold()
                            .foregroundColor(.black)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)
                    .padding(.horizontal)
                    
                    // User Input Fields
                    Group {
                        TextField("Enter Your First Name", text:$firstname)
                        TextField("Enter Your Last Name", text:$lastname)
                        TextField("Enter Your City", text:$city)
                        TextField("Enter Your Address", text:$adddress)
                        
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

                        TextField("Enter Your Email", text:$email)
                        TextField("Enter Your Password", text:$passsword)
                    }
                    .padding()
                    .font(.system(size: 14))
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    
                    // Country Code & Mobile Number
                    HStack {
                        CountryCodePicker(selectedCode: $selectedCountryCode)
                            .frame(width: 80, height: 50)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(5)
                        
                        TextField("Enter Mobile Number", text: $phoneNumber)
                            .padding()
                            .keyboardType(.numberPad)
                            .font(.system(size: 14))
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(5)
                            .frame(maxWidth: .infinity)
                    }
                    .frame(maxWidth: .infinity)
                    
                    // Gender Selection
                    Text("Select Gender")
                        .font(.system(size: 18))
                        .bold()
                        .foregroundColor(.black)
                        .padding(.top)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        ForEach(genders, id: \.self) { gender in
                            Button(action: {
                                selectedGender = gender
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
                    
                    // Sign Up Button
                    Button(action: {
                        print("Sign Up Pressed")
                    }) {
                        Text("Sign Up")
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
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .sheet(isPresented: $showDatePicker) {
                VStack {
                    DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(.wheel)
                        .labelsHidden()
                        .padding()
                    
                    Button("Done") {
                        let formatter = DateFormatter()
                        formatter.dateFormat = "dd/MM/yyyy"
                        date = formatter.string(from: selectedDate)
                        showDatePicker = false
                    }
                    .padding()
                }
            }
        }
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

// Preview
struct Register_View: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
