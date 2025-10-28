import SwiftUI
import GooglePlaces
import CoreLocation
import Combine

struct PlaceSearchView: View {
    @StateObject private var viewModel = PlaceSearchViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    /// Callback returns (placeName, coordinate)
    var onPlaceSelected: ((String, CLLocationCoordinate2D?) -> Void)?

    var body: some View {
        VStack(alignment: .leading) {
            
            // MARK: - Header
            HStack {
                Button(action: { presentationMode.wrappedValue.dismiss() }) {
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.black)
                }
                
                Text("Search the Location")
                    .font(.headline)
                    .padding(.leading, 8)
                Spacer()
            }
            .padding(.top)
            .padding(.horizontal)
            
            // MARK: - Search Bar
            TextField("Search places...", text: $viewModel.query)
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
                .onChange(of: viewModel.query) { _ in
                    viewModel.fetchPredictions()
                }

            Divider()
            
            // MARK: - Predictions List
            List(viewModel.predictions, id: \.placeID) { prediction in
                VStack(alignment: .leading, spacing: 4) {
                    Text(prediction.attributedPrimaryText.string)
                        .font(.body)
                    if let secondary = prediction.attributedSecondaryText?.string {
                        Text(secondary)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .contentShape(Rectangle()) // Ensures tap works on full row
                .onTapGesture {
                    viewModel.selectPrediction(prediction) { name, coordinate in
                        onPlaceSelected?(name, coordinate)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .listStyle(PlainListStyle())
        }
        .navigationBarHidden(true)
    }
}
