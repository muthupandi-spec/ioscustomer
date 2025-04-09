// MARK: - CategoriesResponseModel
typealias CategoriesResponseModel = [CategoriesResponseModelItem]

// MARK: - CategoriesResponseModelItem
struct CategoriesResponseModelItem: Codable, Identifiable, Hashable {
    // Make it Identifiable by returning a unique ID
    var id: Int { categoryId }

    let category: String
    let categoryId: Int
    let isActive: Bool
    let isDelete: Bool
    let time: String

    enum CodingKeys: String, CodingKey {
        case category = "catagory"
        case categoryId = "catagoryId"
        case isActive
        case isDelete
        case time
    }
}
