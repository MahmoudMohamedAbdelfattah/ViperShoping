//
//  AddressModel.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 21/8/2024.
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
