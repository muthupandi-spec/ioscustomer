import Foundation

struct LoginResponseModel: Codable {
    let accessToken: String
    let customerId: Int
    let email: String
    let id: Int
    let mobileNumber: String
    let roles: [String]
    let tokenType: String
    let username: String
}
