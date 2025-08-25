import Foundation

typealias ActiveOrderResponse = [ActiveOrderResponsemodel]

struct ActiveOrderResponsemodel: Codable, Identifiable {
    var id: Int { orderId }

    let orderId: Int
    let firstName: String
    let lastName: String
    let dateCreated: String
    let orderStatus: String
    let mobileNumber: String
    let foodNames: String?
    let totalAmount: Double
    let customerId: Int
    let address: String?
    let pincode: Int
    let street: String
    let city: String
    let landMark: String
    let isDelete: Bool?
    let isActive: Bool?
    let status: String
    let paymentStatus: String?
    let data: [String: String]?
    let customerLat: Double
    let customerLng: Double
    let restaurantLat: Double
    let restaurantLng: Double
    let shopDeviceToken: String?
    let cart: Cart?
    let customer: Customer?
    let orderItems: [OrderItem]
}

struct Cart: Codable {
    let id: Int
    let customerId: Int
    let totalPrice: Double
    let isDelete: Bool?
    let isActive: Bool?
    let cartItems: [String]?
}

struct Customer: Codable {
    let customerId: Int
    let firstName: String
    let lastName: String
    let email: String
    let dateCreated: String?
    let mobileNumber: String
    let password: String?
    let confirmpassword: String?
    let isDelete: Bool?
    let fcmToken: String?
    let otp: String?
    let isVerified: Bool?
    let data: [String: String]?
}

struct OrderItem: Codable {
    let orderItemId: Int
    let foodName: String
    let quantity: Int
    let price: Double
    let subTotal: Double
    let product: Product2
}

struct Product2: Codable {
    let foodId: Int
    let foodName: String
    let price: Int
    let decription: String
    let decription1: String
    let decription2: String
    let isDelete: Bool?
    let isActive: Bool?
    let type: String?
    let catagorybo: CatagoryBO
    let restaurantCatagoryBO: String?
    let image: String
    let imageData: String?
    let catagoryId: Int
}

struct CatagoryBO: Codable {
    let catagoryId: Int
    let catagory: String
    let time: String?
    let isDelete: Bool?
    let isActive: Bool?
}
