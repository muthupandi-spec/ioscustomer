import Foundation

// Model for a single offer item
struct OfferModellItem: Codable {
    let id: Int
    let image: String
    let imageData: String? // Use a wrapper to decode `Any` type
    let isActive: Bool?
    let isDelete: Bool?
    let offerName: String
}

// Model for list of offer items
typealias OfferModel = [OfferModellItem]
