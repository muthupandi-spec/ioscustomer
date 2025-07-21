import Foundation

struct GetProfileResponseModel: Codable {
    let confirmpassword: String
    let customerId: Int
    let email: String
    let fcmToken: String
    let firstName: String
    let isDelete: Bool
    let isVerified: Bool
    let lastName: String
    let mobileNumber: String
    let otp: String?      // Assuming `Any` is usually a string or null
    let password: String
}
