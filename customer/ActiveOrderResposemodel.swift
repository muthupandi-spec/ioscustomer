import Foundation

struct ActiveOrderResponsemodel: Codable, Identifiable {
    var id: Int { orderId }

    let address: String
    let cart: Cart
    let city: String
    let customer: Customer
    let customerId: Int
    let customerLat: Double
    let customerLng: Double
    let dateCreated: String
    let firstName: String
    let foodNames: String?
    let isActive: Bool?
    let isDelete: Bool?
    let landMark: String
    let lastName: String
    let mobileNumber: String
    let orderId: Int
    let orderItems: [OrderItem]
    let orderStatus: String
    let paymentStatus: String?
    let pincode: Int
    let restaurantLat: Double
    let restaurantLng: Double
    let shopDeviceToken: String?
    let status: String?
    let street: String
    let totalAmount: Double

    struct Cart: Codable {
        let cartItems: String?
        let customerId: Int
        let id: Int
        let totalPrice: Double
    }

    struct Customer: Codable {
        let confirmpassword: String?
        let customerId: Int
        let email: String
        let fcmToken: String?
        let firstName: String
        let isDelete: Bool?
        let isVerified: Bool?
        let lastName: String
        let mobileNumber: String
        let otp: String?
        let password: String?
    }

    struct OrderItem: Codable {
        let foodName: String
        let orderItemId: Int
        let price: Double
        let product: Product
        let quantity: Int
        let subTotal: Double

        struct Product: Codable {
            let catagoryId: Int
            let catagorybo: CategoryBO
            let decription: String
            let decription1: String
            let decription2: String
            let foodId: Int
            let foodName: String
            let image: String
            let imageData: String?
            let isActive: Bool?
            let isDelete: Bool?
            let price: Int
            let restaurantCatagoryBO: String?
            let type: String?

            struct CategoryBO: Codable {
                let catagory: String
                let catagoryId: Int
                let isActive: Bool?
                let isDelete: Bool?
                let time: String?
            }
        }
    }
}
