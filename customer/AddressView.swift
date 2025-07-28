import SwiftUI

struct AddressView: View {
    @State private var navigate_addaddress = false
    @State private var addresses: [String] = ["Home", "Office"] // Dummy data
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack{
            
            ZStack {
                VStack {
                    // Header Section
                 header
                    Divider()
                    // Address List
                  addresslist

                    // Buttons
                button
                }
                .background(Color.white.edgesIgnoringSafeArea(.all))

        
            }
            .navigationBarBackButtonHidden(true)
            
        }
    }
    
    private var header :some View{
        HStack {
            Button(action: {
                dismiss()
                
            }) {
                Image("ic_back") // Replace with your back arrow asset
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            
            Text("Address")
                .font(.headline)
                .foregroundColor(.black)
            
            Spacer()
            
            Button(action: {
                // Handle edit action
            }) {
                Image("edit") // Replace with your edit icon asset
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            .opacity(0) // Initially hidden
        }
        .padding(.horizontal, 16)
        .padding(.top, 20)
        
       
    }
    private var addresslist :some View {
        ScrollView {
            LazyVStack {
                ForEach(addresses, id: \.self) { address in
                    AddressRow(address: address)
                }
            }
            .padding(.horizontal, 16)
        }
        .frame(maxHeight: .infinity)
    }
    private var button: some View{
        VStack(spacing: 12) {
            Button(action: {
               navigate_addaddress=true
            }) {
                Text("Add New Address")
                    .frame(maxWidth: .infinity, minHeight: 40)
                    .background(Color.gray.opacity(0.2))
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }.navigationDestination(isPresented: $navigate_addaddress) {
                ManualaddressView()
            }

            Button(action: {
                // Handle apply action
            }) {
                Text("Apply")
                    .frame(maxWidth: .infinity, minHeight: 40)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 20)
    }
}

// Address Row
struct AddressRow: View {
    var address: String

    var body: some View {
        HStack {
            Text(address)
                .font(.body)
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}


struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView()
    }
}
