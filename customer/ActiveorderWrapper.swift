//
//  ActiveorderWrapper.swift
//  customer
//
//  Created by MacBook on 28/07/25.
//

import Foundation
struct ActiveOrderResponseWrapper: Codable {
    let data: [ActiveOrderResponsemodel]
    let message: String
    let status: Int
}
