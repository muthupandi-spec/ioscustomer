import Foundation

struct CancelOrderResponseModel: Codable {
    let address: String?
    let cart: String?
    let city: String?
    let customer: Customer
    let customerId: String?
    let customerLat: Double
    let customerLng: Double
    let data: DataClass
    let dateCreated: String?
    let firstName: String?
    let foodNames: String?
    let isActive: String?
    let isDelete: String?
    let landMark: String?
    let lastName: String?
    let mobileNumber: String?
    let orderId: Int
    let orderItems: String?
    let orderStatus: String
    let paymentStatus: String?
    let pincode: String?
    let restaurantLat: Double
    let restaurantLng: Double
    let shopDeviceToken: String?
    let status: String?
    let street: String?
    let totalAmount: String?

    struct Customer: Codable {
        let confirmpassword: String?
        let customerId: Int
        let email: String?
        let fcmToken: String
        let firstName: String?
        let isDelete: String?
        let isVerified: String?
        let lastName: String?
        let mobileNumber: String?
        let otp: String?
        let password: String?
    }

    struct DataClass: Codable {
        let dateCreated: String
        let firstName: String
        let orderStatus: String
        let status: String
    }
}
