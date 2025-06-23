struct FoodDetailResponseModel: Codable, Identifiable {
    var id: Int { foodId } // uses `foodId` as unique identifier

    let catagorybo: Catagorybo
    let decription: String
    let decription1: String
    let decription2: String
    let foodId: Int
    let foodName: String
    let image: String
    let isActive: Bool?
    let isDelete: Bool?
    let price: Int?

    struct Catagorybo: Codable {
        let catagory: String
        let catagoryId: Int
        let isActive: Bool?
        let isDelete: Bool?
        let time: Int?
    }
}
