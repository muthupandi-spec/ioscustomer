

struct RestaurantCategoriesResponseModelItemm: Codable, Identifiable {
    let isActive: Bool
    let isDelete: Bool
    let restaurantBo: RestaurantBoo
    let restaurantCatagory: String
    let restaurantCatagoryId: Int

    var id: Int { restaurantCatagoryId } // use this as a unique identifier
}

struct RestaurantBoo: Codable {

    let restaurantId: Int
    let restaurantLat: Double
    let restaurantLng: Double
    let restaurantName: String

}
