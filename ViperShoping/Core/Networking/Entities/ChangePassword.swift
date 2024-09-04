//
//  ChangePassword.swift
//  ViperShoping
//
//  Created by Mahmoud on 10/07/2024.
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
