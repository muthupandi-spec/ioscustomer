struct CategoriesResponseModelItem: Codable, Identifiable, Hashable {
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
