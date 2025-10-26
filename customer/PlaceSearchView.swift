import SwiftUI
import GooglePlaces
import Combine

struct PlaceSearchView: View {
    @StateObject private var viewModel = PlaceSearchViewModel()
    @Environment(\.presentationMode) var presentationMode

    var onPlaceSelected: ((String, CLLocationCoordinate2D?) -> Void)?

    var body: some View {
        VStack(alignment: .leading) {
            // Header
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
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

            // Search bar
            TextField("Search places", text: $viewModel.query)
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
                .onChange(of: viewModel.query) { newValue in
                    viewModel.fetchPredictions()
                }

            Divider()

            // Results list
            List(viewModel.predictions, id: \.placeID) { prediction in
                VStack(alignment: .leading) {
                    Text(prediction.attributedPrimaryText.string)
                        .font(.body)
                    Text(prediction.attributedSecondaryText?.string ?? "")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .onTapGesture {
                    viewModel.selectPrediction(prediction) { placeName, coordinate in
                        onPlaceSelected?(placeName, coordinate)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
}
