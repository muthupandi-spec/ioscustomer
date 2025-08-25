//
//  CreateAddressResposeMOdel.swift
//  customer
//
//  Created by MacBook on 28/07/25.
//

import Foundation
struct CreateAddressResponseModel: Codable {
    let addressId: Int?
       let landMark: String?
       let doorNo: String?
       let street: String?
       let address: String?
       let city: String?
       let pincode: Int?
       let isDelete: Bool?
       let customerbo: Customerbo8?
   }

   // MARK: - Customerbo
   struct Customerbo8: Codable {
       let customerId: Int?
       let firstName: String?
       let lastName: String?
       let email: String?
       let dateCreated: String?
       let mobileNumber: String?
       let password: String?
       let confirmpassword: String?
       let isDelete: Bool?
       let fcmToken: String?
       let otp: String?
       let isVerified: Bool?
       let data: [String: String]?   // since it’s empty object {}
   }
