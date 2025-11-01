import Foundation
import CoreLocation
import SwiftUI

struct TrackOrderResponse: Codable {
    let deliveryPartnerLat: Double
    let deliveryPartnerLng: Double
}

struct MapAnnotationItem: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let title: String
    let color: Color
}
