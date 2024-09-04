//
//  SubCategory.swift
//  ViperShoping
//
//  Created by Mahmoud on 10/07/2024.
//

import Foundation


struct SubCategory: Codable {
    var status: Bool?
    var message: String?
    var data: InfoSubCategory?
}


struct InfoSubCategory: Codable {
    var id : Int?
    var price: Double?
    var old_price: Double?
    var discount : Double?
    var image: String?
    var name:String?
    var description: String?
    var images: [String]?
  //  var in_favorites, in_cart: Bool?
 }
