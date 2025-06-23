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


