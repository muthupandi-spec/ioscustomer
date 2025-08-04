import Foundation

struct DeleteAddressResponseModel: Codable {
    let address: String?
    let addressId: Int
    let city: String
    let customerbo: Customerboqq
    let doorNo: String
    let isDelete: Bool
    let landMark: String
    let pincode: Int
    let street: String
}

struct Customerboqq: Codable {
    let confirmpassword: String?
    let customerId: Int
    let email: String?
    let fcmToken: String?
    let firstName: String?
    let isDelete: String?
    let isVerified: String?
    let lastName: String?
    let mobileNumber: String?
    let otp: String?
    let password: String?
}
