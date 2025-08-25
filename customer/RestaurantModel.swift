import Foundation

// Typealias for array response
typealias RestaurantResponsModel = [RestaurantResponsModelItem]

struct RestaurantResponsModelItem: Codable, Identifiable {
    var id: Int { restaurantId }

    let restaurantId: Int
       let restaurantName: String
       let restaurantEMail: String?
       let mobileNumber: String?
       let restaurantPhoneNumber: String?
       let password: String?
       let confirmPassword: String?
       let restaurantType: String?
       let restaurantStreet: String?
       let restaurantCity: String?
       let restaurantPinCode: String?
       let restaurantLandMark: String?
       let restaurantDescreption: String?
       let tradeId: String?
       let dateCreated: String?
       let isDelete: Bool?
       let isActive: Bool?
       let isVerified: Bool?
       let otp: String?
       let data: [String: String]?
       let shopFcmToken: String?
       let restaurantLat: Double?
       let restaurantLng: Double?
       let images: [RestaurantImage]?


    struct RestaurantImage: Codable {
        let imageName: String?
           let imageType: String?
           let imageData: String
    }
}
