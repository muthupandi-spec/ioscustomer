import Foundation

struct UserModel: Identifiable, Codable {
    let id: Int
    let name: String
    let email: String
}
