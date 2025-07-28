//
//  CreateAddressResposeMOdel.swift
//  customer
//
//  Created by MacBook on 28/07/25.
//

import Foundation
struct CreateAddressResponseModel: Codable {
    let status: String
    let message: String
    let addressId: Int?
}
