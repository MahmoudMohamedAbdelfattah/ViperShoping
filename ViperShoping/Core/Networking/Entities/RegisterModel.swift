//
//  RegisterModel.swift
//  ViperShoping
//
//

import Foundation

struct RegisterModule :Codable{
    
    var status : Bool?
    var message : String?
    var data : DataToken?
}

struct DataToken:Codable{
    var name , phone , email : String?
    var id : Int?
    var image : String?
    var token : String?
}

struct SignUpRequestModel{
    let name: String
    let email: String
    let password: String
    let phone : String
}

extension SignUpRequestModel{
    var parameter: [String : String]{
        return [ "name" : self.name,
                 "email" : self.email,
                 "password": self.password,
                 "phone": self.phone
        ]
    }
}
