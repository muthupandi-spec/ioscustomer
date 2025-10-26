import Foundation
import GooglePlaces
import CoreLocation

final class PlaceSearchViewModel: ObservableObject {
    @Published var query: String = ""
    @Published var predictions: [GMSAutocompletePrediction] = []

    private var placesClient = GMSPlacesClient.shared()
    private var sessionToken = GMSAutocompleteSessionToken.init()
    private var debounceTimer: Timer?

    func fetchPredictions() {
        // Cancel previous debounce
        debounceTimer?.invalidate()

        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            self.predictions = []
            return
        }

        // Add a small debounce delay like Android's TextWatcher behavior
        debounceTimer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { _ in
            let filter = GMSAutocompleteFilter()
            filter.type = .noFilter

            self.placesClient.findAutocompletePredictions(fromQuery: self.query,
                                                          filter: filter,
                                                          sessionToken: self.sessionToken) { results, error in
                if let error = error {
                    print("Prediction fetch failed: \(error.localizedDescription)")
                    return
                }

                self.predictions = results ?? []
            }
        }
    }

    func selectPrediction(_ prediction: GMSAutocompletePrediction,
                          completion: @escaping (String, CLLocationCoordinate2D?) -> Void) {

        let placeId = prediction.placeID
        let fields: GMSPlaceField = [.name, .formattedAddress, .coordinate]

        placesClient.fetchPlace(fromPlaceID: placeId,
                                placeFields: fields,
                                sessionToken: sessionToken) { place, error in
            if let error = error {
                print("Place details fetch failed: \(error.localizedDescription)")
                return
            }

            guard let place = place else { return }

            print("Selected place: \(place.name ?? ""), \(place.formattedAddress ?? "")")
            completion(place.formattedAddress ?? place.name ?? "Unknown", place.coordinate)
        }
    }
}
