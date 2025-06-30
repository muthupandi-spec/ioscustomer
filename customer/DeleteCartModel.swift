//
//  DeleteCartModel.swift
//  customer
//
//  Created by MacBook on 27/06/25.
//

import Foundation
struct DeleteCartModel: Codable {
    let id: Int
    let customerId: Int
    let totalPrice: Double
    let cartItems: [CartItem1]? // Assuming cartItems is an array or can be defined later
}

// Optional placeholder for CartItem (you can update based on your actual structure)
struct CartItem1: Codable {
    // define properties according to your API's cartItems structure
}
