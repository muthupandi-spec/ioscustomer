import Foundation

typealias ViewFavouriteResponseModel = [ViewFavouriteResponseModelItem]

struct ViewFavouriteResponseModelItem: Codable {
    let addFavId: Int
    let customerbo: CustomerBOFavourite
    let isDelete: String?
    let itembo: ItemBOFavourite
    let message: String?
    let restaurantbo: RestaurantBOFavourite? // <- make this optional!
}

struct CustomerBOFavourite: Codable {
    let confirmpassword: String?
    let customerId: Int
    let email: String
    let fcmToken: String?
    let firstName: String
    let isDelete: String?
    let isVerified: String?
    let lastName: String
    let mobileNumber: String
    let otp: String?
    let password: String?
}

struct ItemBOFavourite: Codable {
    let catagoryId: Int
    let catagorybo: String?
    let decription: String
    let decription1: String?
    let decription2: String?
    let foodId: Int
    let foodName: String
    let image: String
    let imageData: String?
    let isActive: String?
    let isDelete: String?
    let price: Int
    let restaurantCatagoryBO: String?
    let type: String?
}

struct RestaurantBOFavourite: Codable {
    let confirmPassword: String?
    let dateCreated: String?
    let images: [String]?
    let isActive: String?
    let isDelete: String?
    let password: String?
    let restaurantCity: String?
    let restaurantDescreption: String?
    let restaurantEMail: String?
    let restaurantId: Int
    let restaurantLandMark: String?
    let restaurantLat: Double?
    let restaurantLng: Double?
    let restaurantName: String
    let restaurantPhoneNumber1: Int64?   // <-- optional now
    let restaurantPhoneNumber2: String?
    let restaurantPinCode: String?
    let restaurantStreet: String?
    let restaurantType: String?
    let shopDeviceToken: String?
}
