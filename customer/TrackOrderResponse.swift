import Foundation
import CoreLocation
import SwiftUI

struct TrackOrderResponseModel: Codable {
    let deliveryPartnerId: Int?
        let deliveryPartnerName: String?
        let deliveryPartnerEmail: String?
        let mobileNumber: String?
        let deliveryPartnerAddress: String?
        let vehicleDetails: String?
        let vehicleNumber: String?
        let deliveryPartnerProof1: String?
        let deliveryPartnerProof2: String?
        let deliveryPartnerVehicleLicence: String?
        let password: String?
        let confirmPassword: String?
        let isDelete: Bool?
        let isActive: Bool?
        let dateCreated: String?
        let dateModified: String?
        let isVerified: Bool?
        let otp: String?
        let data: [String: String]?
        let bankName: String?
        let accountHolderName: String?
        let accountNumber: String?
        let ifscCode: String?
        let partnerStatus: String?
        let profileImage: String?
        let profileImageData: String?
        let deliveryPartnerFcmToken: String?
        let deliveryPartnerLat: Double?
        let deliveryPartnerLng: Double?
        let images: [String]?
}

struct MapAnnotationItem: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let title: String
    let color: Color
}
