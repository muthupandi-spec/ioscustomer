import Foundation

struct CartResponseModel: Codable, Identifiable {
    let id: Int
    let customerId: Int
    let totalPrice: Double
    let cartItems: [CartItem]
}

struct CartItem: Codable {
    let foodName: String
    let quantity: Int
    let price: Double
    let subTotal: Double
    let product: Product1
}

struct Product1: Codable {
    let foodId: Int
    let foodName: String
    let price: Int
    let decription: String
    let decription1: String?
    let decription2: String?
    let isDelete: Bool?
    let isActive: Bool?
    let catagorybo: Category1
    let image: String
    let imageData: String?
    let catagoryId: Int
}

struct Category1: Codable {
    let catagoryId: Int
    let catagory: String
    let time: String?
    let isDelete: Bool?
    let isActive: Bool?
}
