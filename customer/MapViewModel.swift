import Foundation
import MapKit
import CoreLocation
import Combine
import SwiftUI

class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var annotations: [MapAnnotationItem] = []
    @Published var currentRoute: MKRoute? = nil

    private let locationManager = CLLocationManager()
    private var userLocation: CLLocationCoordinate2D?
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
        userLocation = location.coordinate
    }

    // MARK: - 🚍 Draw Actual Route (Bus/Driving Path)
    func drawBusRoute(from origin: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D) {
        guard !directionsRequestInProgress else {
            print("⚠️ Too many route requests, skipping new one...")
            return
        }

        directionsRequestInProgress = true

        // Setup placemarks
        let sourcePlacemark = MKPlacemark(coordinate: origin)
        let destinationPlacemark = MKPlacemark(coordinate: destination)

        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: sourcePlacemark)
        request.destination = MKMapItem(placemark: destinationPlacemark)
        request.transportType = .automobile // can change to .transit for bus routes

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

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                self?.annotations = [
                    MapAnnotationItem(coordinate: origin, title: "Origin", color: .blue),
                    MapAnnotationItem(coordinate: destination, title: "Destination", color: .red)
                ]
                self?.currentRoute = route
            }
        }
    }
}
