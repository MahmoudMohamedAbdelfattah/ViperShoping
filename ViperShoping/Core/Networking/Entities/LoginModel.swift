//
//  LoginModel.swift
//  ViperShoping
//
 //

import Foundation


struct LoginModel:Codable{
    var status:Bool?
    var message :String?
    var data:DataLog?
}
struct DataLog:Codable {
    var id:Int?
    var name:String?
    var email:String?
    var phone:String?
    var image:String?
    var points:Int?
    var credit :Int?
    var token:String?
}
