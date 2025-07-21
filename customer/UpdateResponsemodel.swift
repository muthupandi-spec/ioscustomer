import Foundation

struct UpdateProfileResponseModel: Codable {
    let confirmpassword: String
    let customerId: Int
    let email: String
    let fcmToken: String
    let firstName: String
    let isDelete: Bool?
    let isVerified: Bool?
    let lastName: String
    let mobileNumber: String
    let otp: String?
    let password: String
}
