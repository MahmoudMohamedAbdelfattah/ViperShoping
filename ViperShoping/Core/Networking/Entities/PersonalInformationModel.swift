//
//  PersonalInformation.swift
//  ViperShoping
//
//  Created by Mahmoud on 10/09/2023.
//

import Foundation

struct InformationPersonal : Codable {
        var status: Bool?
        var message: String?
        var data : PersonalData?
    }

struct PersonalData : Codable{
        var id : Int?
        var name : String?
        var email : String?
        var phone : String?
        var image : String?
        var points : Int?
        var credit : Int?
        var token :  String?
    }

