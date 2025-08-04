import Foundation

struct FoodItem: Codable {
    let foodId: Int
    let foodName: String
    let price: Int
    let decription: String
    let decription1: String
    let decription2: String
    let isDelete: Bool
    let isActive: Bool
    let catagorybo: Category
    let image: String
    let catagoryId: Int
}

struct Category: Codable {
    let catagoryId: Int
    let catagory: String
    let time: String? // null supported
    let isDelete: Bool
    let isActive: Bool
}


//struct FoodItem: Codable {
//    let foodId: Int
//    let foodName: String
//    let price: Int
//    let decription: String
//    let decription1: String
//    let decription2: String
//    let isDelete: Bool
//    let isActive: Bool
//    let type: String
//    let catagorybo: CategoryBO?
//    let restaurantCatagoryBO: RestaurantCategoryBO?
//    let image: String
//    let imageData: String
//    let catagoryId: Int
//
//    struct CategoryBO: Codable {
//        // This is null in your JSON.
//        // Add properties here if needed.
//    }
//
//    struct RestaurantCategoryBO: Codable {
//        let restaurantCatagoryId: Int
//        let restaurantCatagory: String
//        let isDelete: Bool?
//        let isActive: Bool?
//        let restaurantBo: RestaurantBO?
//        let restaurantId: Int?
//
//        struct RestaurantBO: Codable {
//            // This is also null in your JSON.
//            // Add properties if necessary.
//        }
//    }
//}
