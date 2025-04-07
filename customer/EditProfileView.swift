import SwiftUI
import CountryPickerView

struct EditProfileView: View {
    @State private var selectedCountryCode: String = "+91"
    @State private var phoneNumber: String = ""
    @State private var selectedGender = "Male" // Default selection
    @State private var firstname: String = ""
    @State private var lastname: String = ""
    @State private var city: String = ""
    @State private var adddress: String = ""
    @State private var date: String = ""
    @State private var email: String = ""
    @State private var passsword: String = ""
    let genders = ["Male", "Female", "Others"]
    
    var body: some View {
        NavigationStack{
            VStack {
                // Title & Back Button
                HStack {
                    Image("ic_back")
                        .resizable()
                        .frame(width: 23, height: 23)
                    
                    Text("Edit Your Profile")
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
                    TextField("Enter Your Date of Birth", text:$date)
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
                    
                    TextField("Enter Mobile Number", text: .constant(""))
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
                        .buttonStyle(PlainButtonStyle()) // Removes default button styling
                    }
                }
                
                // Login Button
                Button(action: {
                    print("Sign In Pressed")
                }) {
                    Text("Update")
                        .font(.headline)
                        .frame(maxWidth: .infinity, minHeight: 40)
                        .background(Color("colorPrimary"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 10)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
       
    }
    struct Profile_view: PreviewProvider {
        static var previews: some View {
            EditProfileView()
        }
    }
}


