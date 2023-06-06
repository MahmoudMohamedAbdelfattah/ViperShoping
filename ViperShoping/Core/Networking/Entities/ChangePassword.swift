//
//  ChangePassword.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 22/8/2024.
//

import Foundation

struct ChangePassword : Codable {
    var status:Bool?
    var message :String?
    var data: DataChangePassword?
}

struct DataChangePassword : Codable {
    
    var email : String?
}
