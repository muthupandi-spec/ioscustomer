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
    @State private var selectedDate = Date()
    @State private var showDatePicker = false
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = HomeviewModel()

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
                        print("Sign Up Pressed")
                        viewModel.updateprofile()
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
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .navigationBarBackButtonHidden(true)
            
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
                .frame(maxWidth: .infinity)
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
    struct Profile_view: PreviewProvider {
        static var previews: some View {
            EditProfileView()
        }
    }
}


