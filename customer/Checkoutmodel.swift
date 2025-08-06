import Foundation

struct CheckoutResponseModel: Codable {
    let address: String?           // ✅ Made optional
    let cart: String?
    let city: String?
    let customer: String?
    let customerId: String?
    let customerLat: Double?
    let customerLng: Double?
    let data: DataClass?
    let dateCreated: String?
    let firstName: String?
    let foodNames: String?
    let isActive: String?
    let isDelete: String?
    let landMark: String?
    let lastName: String?
    let mobileNumber: String?
    let orderId: Int?
    let orderItems: String?
    let orderStatus: String?
    let paymentStatus: String?
    let pincode: Int?
    let restaurantLat: Double?
    let restaurantLng: Double?
    let shopDeviceToken: String?
    let status: String?
    let street: String?
    let totalAmount: String?

    struct DataClass: Codable {
        let dateCreated: String?
        let firstName: String?
        let lastName: String?
        let paymentStatus: String?
    }
}
