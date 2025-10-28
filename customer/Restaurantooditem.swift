import Foundation

// MARK: - FoodItem
struct RestaurantFoodItem: Codable, Identifiable {
    let foodId: Int
    let foodName: String
    let price: Int
    let decription: String
    let decription1: String
    let decription2: String
    let isDelete: Bool
    let isActive: Bool
    let type: String? // or use a custom type if needed
    let catagorybo: FoodCategory?
    let restaurantCatagoryBO: RestaurantCatagoryBO?
    let image: String?
    let imageData: String?
    let catagoryId: Int

    var id: Int { foodId } // For ForEach use
}
struct FoodCategory: Codable {
    let catagoryId: Int
    let catagory: String
    let time: String? // nullable
    let isDelete, isActive: Bool
}
// MARK: - RestaurantCatagoryBO
struct RestaurantCatagoryBO: Codable {
    let restaurantCatagoryId: Int
    let restaurantCatagory: String
    let isDelete: Bool?
    let isActive: Bool?
    let restaurantBo: RestaurantBo?
    let restaurantId: Int?
}

// MARK: - RestaurantBo
struct RestaurantBo: Codable {
    let restaurantId: Int
    let restaurantName: String
    let restaurantEMail: String?
    let restaurantPhoneNumber1: Int?
    let restaurantPhoneNumber2: String?
    let password: String?
    let confirmPassword: String?
    let restaurantType: String?
    let restaurantStreet: String?
    let restaurantCity: String?
    let restaurantPinCode: String?
    let restaurantLandMark: String?
        let restaurantDescreption: String?
        let dateCreated: String?
        let isDelete: Bool?
        let isActive: Bool?
        let shopDeviceToken: String?
        let restaurantLat: Double
        let restaurantLng: Double
        let images: [String]
}
