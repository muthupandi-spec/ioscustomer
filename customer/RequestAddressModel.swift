//
//  RequestAddressModel.swift
//  customer
//
//  Created by MacBook on 28/07/25.
//

import Foundation
struct RequestAddressModel: Encodable {
    let landMark: String
    let doorNo: String
    let street: String
    let place: String
    let city: String
    let pincode: String
    let customerbo: CustomerBO
}

struct CustomerBO: Encodable {
    let customerId: Int
}


