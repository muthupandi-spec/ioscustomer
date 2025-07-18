//
//  OtpResponseModel.swift
//  customer
//
//  Created by MacBook on 09/07/25.
//

import Foundation

struct OtpResponseModel: Codable {
    let customerId: Int
      let firstName: String
      let lastName: String
      let email: String
      let mobileNumber: String
      let password: String
      let confirmpassword: String
      let isDelete: Bool
      let fcmToken: String
      let otp: String?
      let isVerified: Bool?
   
}
