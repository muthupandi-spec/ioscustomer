import Foundation

struct CartResponseModel: Codable, Identifiable {
    let id: Int
      let customerId: Int
      let totalPrice: Double
      let isDelete: Bool?
      let isActive: Bool?
      let cartItems: [CartItem]
  }
import Foundation


// MARK: - Cart Item
struct CartItem: Codable {
    let foodName: String
    let quantity: Int
    let price: Double
    let subTotal: Double
    let isDelete: Bool?
    let isActive: Bool?
    let product: Product
}

// MARK: - Product
struct Product: Codable {
    let foodId: Int
    let foodName: String
    let price: Double
    let decription: String
    let decription1: String
    let decription2: String
    let isDelete: Bool?
    let isActive: Bool?
    let type: String?
    let catagorybo: CategoryBO
    let restaurantCatagoryBO: RestaurantCategoryBO
    let image: String?
    let imageData: String?
    let catagoryId: Int
}

// MARK: - CategoryBO
struct CategoryBO: Codable {
    let catagoryId: Int
    let catagory: String
    let time: String?
    let isDelete: Bool?
    let isActive: Bool?
}

// MARK: - RestaurantCategoryBO
struct RestaurantCategoryBO: Codable {
    let restaurantCatagoryId: Int
    let restaurantCatagory: String
    let isDelete: Bool?
    let isActive: Bool?
    let restaurantBo: String?
    let restaurantId: Int?
}


