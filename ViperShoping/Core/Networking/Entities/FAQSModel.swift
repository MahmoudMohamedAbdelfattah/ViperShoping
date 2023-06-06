//
//  FAQSModel.swift
//  ViperShoping
//
//  Created by Mahmoud on 23/07/2023.
//

import Foundation

struct FaqsModule : Codable {
    var status: Bool?
    var message :String?
    var data: InfoData?
}
struct InfoData : Codable {
    var current_page: Int?
    var data: [ALLData]?
    var first_page_url: String?
    var from, last_page: Int?
    var last_page_url: String?
    var path: String?
    var per_page: Int?
    var to, total: Int?
}
struct ALLData : Codable {
    var id: Int?
    var question, answer: String?
}
