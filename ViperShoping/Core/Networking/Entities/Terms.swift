//
//  Terms.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 27/8/2024.
//

import Foundation

    struct Terms : Codable {
        var status : Bool?
        var message : String?
        var data: data?
    }

    struct data : Codable {
        var about : String?
        var terms : String?
    }


 
