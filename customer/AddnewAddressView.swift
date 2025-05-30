import SwiftUI
import MapKit

struct MapAddressView: View {
    @State private var address: String = ""
    @State private var building: String = ""
    @State private var landmark: String = ""
    @State private var category: String = ""
    @State private var selectedCategory = "Home"
    let categories = ["Home", "Work", "Others"]
    @Environment(\.dismiss) var dismiss

    
    var body: some View {
        NavigationStack{
            ZStack {
                VStack {
                    // Header Section
                  header
                    MapView()
                        .frame(height: 300)
                        .edgesIgnoringSafeArea(.top)
                        .offset(y: -32) // Equivalent to marginBottom -32dp
                    addadress
                   
                }
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
            
            Text("AddNewAddress")
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
        }.offset(y: -42)
        .padding(.horizontal, 16)
        .padding(.top, 20)
    }
    private var addadress :some  View{
        VStack {
            Text("Location")
                .font(.title2)
                .padding(.bottom, 6)
            
            Divider()
                .frame(width: 40, height: 2)
                .background(Color.gray)
                .padding(.bottom, 6)
            
            TextField("Search location", text: $address)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                .padding(.horizontal)
            
            Divider()
                .background(Color.gray)
                .padding(.horizontal)
            
            HStack {
                TextField("Building No.", text: $building)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                
                TextField("Landmark", text: $landmark)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
            }
            .padding(.horizontal)
            
            Divider()
                .background(Color.gray)
                .padding(.horizontal)
            
            Picker("Category", selection: $selectedCategory) {
                ForEach(categories, id: \ .self) { category in
                    Text(category)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            
            Divider()
                .background(Color.gray)
                .padding(.horizontal)
            
            Button(action: {
                // Handle set location action
            }) {
                Text("Continue")
                    .frame(maxWidth: .infinity, minHeight: 40)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
        .padding(.top, -20)
    }
}

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {}
}

struct MapAddressView_Previews: PreviewProvider {
    static var previews: some View {
        MapAddressView()
    }
}
