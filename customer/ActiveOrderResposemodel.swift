import Foundation

// MARK: - ActiveOrderResponse
typealias ActiveOrderResponse = [ActiveOrderResponsemodel]

// MARK: - ActiveOrderResponseModel
struct ActiveOrderResponsemodel: Codable, Identifiable {
    var id: Int { orderId }

    let orderId: Int
    let firstName, lastName: String
    let dateCreated: String
    let orderStatus: String
    let mobileNumber: String
    let foodNames: String?
    let totalAmount: Double
    let customerId: Int
    let address: String?
    let pincode: Int
    let street, city, landMark: String
    let isDelete, isActive: Bool?
    let status: String
    let restaurantId: Int?
    let paymentStatus: String?
    let data: [String: String]?
    let customerLat, customerLng, restaurantLat, restaurantLng: Double
    let shopDeviceToken: String?
    let cart: Cart
    let customer: Customer
    let orderItems: [OrderItem]
}

// MARK: - Cart
struct Cart: Codable {
    let id, customerId: Int
    let totalPrice: Double
    let isDelete, isActive: Bool?
    let cartItems: String?
}

// MARK: - Customer
struct Customer: Codable {
    let customerId: Int
    let firstName, lastName, email: String
    let dateCreated: String?
    let mobileNumber: String
    let password, confirmpassword: String?
    let isDelete, isVerified: Bool?
    let fcmToken, otp: String?
    let data: [String: String]?
}

// MARK: - OrderItem
struct OrderItem: Codable, Identifiable {
    let orderItemId: Int
    let foodName: String
    let quantity: Int
    let price, subTotal: Double
    let product: APIProduct?

    var id: Int { orderItemId }
}


// MARK: - Product
struct APIProduct: Codable {
    let foodId: Int
    let foodName: String
    let price: Double
    let decription, decription1, decription2: String
    let isDelete, isActive: Bool?
    let type: String?
    let catagorybo: CategoryDetail?
    let restaurantCatagoryBO: APIRestaurantCategory?
    let image: String
    let imageData: String?
    let catagoryId: Int
}

struct APIRestaurantCategory: Codable {
    let restaurantCatagoryId: Int
    let restaurantCatagory: String
    let isDelete, isActive: Bool?
    let restaurantBo: String?
    let restaurantId: Int?
}


// MARK: - CategoryDetail
struct CategoryDetail: Codable {
    let catagory: String
    let catagoryId: Int
    let isActive, isDelete: Bool?
    let time: String?
}


