//
//  ConfigApi.swift
//  ViperShoping
//
//  Created by Mahmoud on 30/06/2023.
//

import Foundation

// https://student.valuxapps.com/api/addresses
struct UrlApi {
    
    static let Main = "https://student.valuxapps.com/api/"
    static let register =  "register"
    static let login =  "login"
    static let updateProfile =  "update-profile"
    static let Banner = "banners"
    static let Home = "home"
    static let Categories = "categories"
    static let categoryDetails = "products"
    static let search =  "products/search"
    static let GetInfo =  "profile"
    static let faqs = "faqs"
    static let newAddress = "addresses"
    static let getAdress =  "addresses"
    static let terms = "settings"
    static let complaints = "complaints"
    
    static let Exite = Main + "logout"
    
    static let ChangePassword = "change-password"
    static let addFavorite = Main + "favorites"
    static let addCarts = Main + "carts"
    static let aboutAndTerms = Main + "settings"
 
}
