//
//  BannerModel.swift
//  ViperShoping
//
//  Created by Mahmoud on 08/07/2024.
//  Created by Mahmoud on 10/07/2024.

import Foundation


struct HomeModel : Codable {
    
    var status : Bool?
    var message : String?
    var data: Alldata?
}

struct Alldata : Codable {
    
    var banners : [AllBanners]?
    var products: [AllProducts]?
    var ad : String?

}

struct AllBanners : Codable {
    var id : Int?
    var image:String?
  var category :AllCategoryy?
    
}
struct AllCategoryy: Codable {
    var id: Int?
    var image: String?
    var name: String?
}
struct AllProducts:Codable {
    var id: Int?
    var  price : Double?
    var old_price: Double?
    var discount: Int?
    var image: String?
    var name: String?
    var description: String?
    var images: [String]?
    var inFavorites :Bool?
    var inCart: Bool?
}
