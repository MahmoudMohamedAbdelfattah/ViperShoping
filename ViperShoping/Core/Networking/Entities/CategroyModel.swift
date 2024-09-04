//
//  CategroyModel.swift
//  ViperShoping
//
//  Created by Mahmoud on 10/07/2024.
//

import Foundation


struct CategoryModel : Codable {
    var status : Bool?
    var message : String?
    var data : AllData?
}

struct AllData : Codable {
    var data : [DataInfo]?
    var first_page_url: String?
    var from: Int?
    var last_page: Int?
    var last_page_url: String?
  //  var next_page_ur: null
    var path: String?
    var per_page: Int?
//    var prev_page_url: null
    var to: Int?
    var total: Int?
}

struct DataInfo : Codable {
    var id: Int?
    var name: String?
    var image: String?
}
