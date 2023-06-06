//
//  ErrorModel.swift
//  ViperShoping
//
//  Created by Mahmoud on 10/07/2023.
//

import Foundation


struct ErroreModel:Codable{
    var status:Bool?
    var message :String?
    var data:DataLog?
}
