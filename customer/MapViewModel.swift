import Foundation
import MapKit
import Combine
import SwiftUI

class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var annotations: [MapAnnotationItem] = []
    @Published var currentRoute: MKRoute? = nil
    @Published var userCoordinate: CLLocationCoordinate2D? = nil // ✅ Store current location

    private let locationManager = CLLocationManager()
    private var cancellables = Set<AnyCancellable>()
    private var directionsRequestInProgress = false

    override init() {
        super.init()
        setupLocationManager()
    }

    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            manager.startUpdatingLocation()
        case .denied, .restricted:
            print("❌ Location permission denied")
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        @unknown default:
            break
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        userCoordinate = location.coordinate // ✅ Keep current location
    }

    // MARK: - 🚀 API CALL: Fetch delivery partner location
    func fetchTrackOrder(deliveryboyid: Int) {
        APIService().fetchTrackOrder(deliveryboyid: deliveryboyid) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    print("✅ Got tracking data: \(response)")
                    self?.updateMap(with: response)
                case .failure(let error):
                    print("❌ Failed to fetch tracking: \(error.localizedDescription)")
                }
            }
        }
    }



    // MARK: - 🗺️ Update map and draw route
    private func updateMap(with response: TrackOrderResponseModel) {
        guard let currentLoc = userCoordinate else {
            print("⚠️ Current location not available yet.")
            return
        }

        let deliveryCoord = CLLocationCoordinate2D(
            latitude: response.deliveryPartnerLat ?? 0.0,
            longitude: response.deliveryPartnerLng ?? 0.0
        )

        // ✅ Use current location (restaurant device) instead of restaurantLat/Lng from API
        drawBusRoute(from: currentLoc, to: deliveryCoord)
    }

    // MARK: - 🧭 Draw polyline
    func drawBusRoute(from origin: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D) {
        guard !directionsRequestInProgress else {
            print("⚠️ Too many route requests, skipping new one...")
            return
        }

        directionsRequestInProgress = true

        let sourcePlacemark = MKPlacemark(coordinate: origin)
        let destinationPlacemark = MKPlacemark(coordinate: destination)

        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: sourcePlacemark)
        request.destination = MKMapItem(placemark: destinationPlacemark)
        request.transportType = .automobile

        let directions = MKDirections(request: request)
        directions.calculate { [weak self] response, error in
            DispatchQueue.main.async {
                self?.directionsRequestInProgress = false
            }

            if let error = error {
                print("❌ Directions error: \(error.localizedDescription)")
                return
            }

            guard let route = response?.routes.first else {
                print("⚠️ No route found.")
                return
            }

            DispatchQueue.main.async {
                self?.annotations = [
                    MapAnnotationItem(coordinate: origin, title: "You ", color: .blue),
                    MapAnnotationItem(coordinate: destination, title: "Delivery Boy", color: .red)
                ]
                self?.currentRoute = route
            }
        }
    }
}
