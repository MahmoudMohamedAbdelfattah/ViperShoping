//
//  CategoryDetails.swift
//  ViperShoping
//
//  Created by Mahmoud on 21/07/2023.
//

import UIKit



struct CategoriesDeatial: Codable  {
    var status: Bool?
    var message:String?
    var data: DataDetiasl?
}

struct DataDetiasl: Codable {
    var currentPage: Int?
    var first_page_url: String?
    var from: Int?
    var last_page : Int?
    var last_page_url: String?
    var path:String?
    var per_page: Int?
    var to: Int?
    var total: Int?
   // var sub_total : Int?
    var data : [CategoryDataDetials]?
}

struct CategoryDataDetials :Codable  {
    var id: Int?
    var price: Double?
    var quantity : Int?
    var old_price: Double?
    var discount: Int?
    var image: String?
    var name:String?
    var description: String?
    var images: [String]?
    var isFavorite:Bool?
    var isCart:Bool?
 }

struct Invoices :Codable  {
    var id: String?
    var date : String?
    var totalPrice: Double?
    var totalQuantity   : Int32?
 
 }
