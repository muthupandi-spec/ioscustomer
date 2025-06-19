import Foundation

// Main model: list of restaurant items
typealias RestaurantResponsModel = [RestaurantResponsModelItem]

// Single restaurant item
struct RestaurantResponsModelItem: Codable, Identifiable {
    var id: Int { restaurantId }

    let confirmPassword: String
    let dateCreated: String
    let images: [Image]
    let isActive: Bool
    let isDelete: Bool
    let password: String
    let restaurantCity: String?
    let restaurantDescreption: String?
    let restaurantEMail: String
    let restaurantId: Int
    let restaurantLandMark: String?
    let restaurantLat: Double
    let restaurantLng: Double
    let restaurantName: String
    let restaurantPhoneNumber1: Int64
    let restaurantPhoneNumber2: String?
    let restaurantPinCode: String?
    let restaurantStreet: String
    let restaurantType: String?
    let shopDeviceToken: String?

    // Nested image struct
    struct Image: Codable {
        let imageData: String
        let imageName: String
        let imageType: String?
    }
}
