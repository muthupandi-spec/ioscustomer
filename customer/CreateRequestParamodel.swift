import Foundation

struct CreateRequestParamModel: Codable {
    let customerbo: Customer
    let itembo: ItemBO
    let restaurantbo: Restaurant

    struct Customer: Codable {
        let customerId: Int
    }

    struct ItemBO: Codable {
        let foodId: Int
    }

    struct Restaurant: Codable {
        let restaurantId: Int
    }
}
