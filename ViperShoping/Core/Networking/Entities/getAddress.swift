//
//  getAddress.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 26/8/2024.
//

import Foundation


struct getAddress : Codable {
    
    var status: Bool?
    var message : String?
    var data : allData?
}

struct allData : Codable{
    var data :[dataAddress]
}

struct dataAddress : Codable{
    
    var name: String?
    var city : String
    var region : String?
    var details : String?
    
    
}

 
