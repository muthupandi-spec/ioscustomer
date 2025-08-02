//
//  AddressResposeModel.swift
//  customer
//
//  Created by MacBook on 02/08/25.
//

import Foundation

struct GetAddressResponseModelItem: Codable, Identifiable {
    let addressId: Int
    let landMark: String
    let doorNo: String
    let street: String
    let address: String?     // null in JSON, use optional
    let city: String
    let pincode: Int
    let isDelete: Bool
    let customerbo: Customerbo

    var id: Int { addressId }  // Needed for ForEach

    struct Customerbo: Codable {
        let customerId: Int
        let firstName: String?
        let lastName: String?
        let email: String?
        let mobileNumber: String?
        let password: String?
        let confirmpassword: String?
        let isDelete: Bool?
        let fcmToken: String?
        let otp: String?
        let isVerified: Bool?
    }
}

