//
//  AddressModel.swift
//  ViperShoping
//
//  Created by Mahmoud on 10/07/2024.
//

import Foundation
 
struct AddresModel:Codable{
    var status:Bool?
    var message :String?
    var data:DataAddress?
}

struct DataAddress:Codable {
    var name:String?
    var city:String?
    var region:String?
    var details:String?
    var latitude:Double?
    var longitude :Double?
    var notes:String?
    var id:Int?
}
