//
//  UpdateProfile.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 23/8/2024.
//

import Foundation

struct UpdateProfile :Codable{
    var status: Bool?
    var message: String?
    var data : DataProfile
}

struct DataProfile :Codable{
    var id: Int?
    var name: String?
    var email: String?
    var phone: String?
    var image : String?
}

