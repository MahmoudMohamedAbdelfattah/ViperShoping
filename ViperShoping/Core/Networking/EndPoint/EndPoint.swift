//
//  EndPoint.swift
//  ViperShoping
//
//  Created by Mahmoud on 30/06/2024.
//

import Foundation

enum NetworkEnvironment {
    
    case login(email:String, password:String , lang : String , Content_Type :String )
    case regestration (name :String ,email :String ,password:String ,phone:String , image: String ,  lang : String , Content_Type :String)
    case Home ( Content_Type : String , lang : String , Authorization : String)
    case category(lang : String)
    case categoryDetails(category_id : Int, Content_Type : String , lang : String , Authorization : String)
    case subCategory(id : Int , Content_Type : String , lang : String , Authorization : String)
    case faqs (lang : String )
    case profile( Content_Type : String , lang : String , Authorization : String)
    case search (text:String ,Content_Type : String , lang : String , Authorization : String)
    case address(name:String ,city:String ,region:String ,details:String ,latitude:Double ,longitude:Double , notes:String,Content_Type : String , lang : String , Authorization : String)
    case changePassword(current_password:String,new_password:String,Content_Type : String , lang : String , Authorization : String)
    case updateProfile(name:String, phone:String , email:String , image:String , Content_Type : String , lang : String , Authorization : String)
    case getAddresses(Content_Type : String , lang : String , Authorization : String)
    case terms(lang : String)
    
}

extension NetworkEnvironment : EndPointType {
  
    // MARK: - baseURL
    var baseURL: URL {
 
        guard let url = URL(string: UrlApi.Main) else { fatalError("baseURL could not be configured.")}
        return url
     
    }
    // MARK: - Path
    var path: String {
        switch self {
        case.login :
            return "\(UrlApi.login)"
        case.regestration :
            return "\(UrlApi.register)"
        case .Home:
            return "\(UrlApi.Home)"
        case .category:
            return "\(UrlApi.Categories)"
        case.categoryDetails:
          
            return "\(UrlApi.categoryDetails)"
            
        case .faqs:
            return "\(UrlApi.faqs)"

        case .profile:
            return "\(UrlApi.GetInfo)"
 
        case .subCategory:
            return "\(UrlApi.categoryDetails)"
            
        case .search:
            return "\(UrlApi.search)"
            
        case .address :
            return"\(UrlApi.newAddress)"
        case .changePassword :
            return"\(UrlApi.ChangePassword)"
        case .updateProfile:
            return"\(UrlApi.updateProfile)"
        case .getAddresses:
            return "\(UrlApi.getAdress)"
        case .terms:
            return "\(UrlApi.terms)"

        }
    }
    // MARK: - HTTPMethod
    var httpMethod: HTTPMethod {
        switch self {
        case.login :
            return .post
        case.regestration:
            return .post
        case .Home:
            return .get
        case .category:
            return .get
        case .categoryDetails:
            return .get
        case .faqs:
            return .get
        case .profile:
            return .get
        case .subCategory:
            return .get
        case .search:
            return .post
        case .address:
            return .post
        case .changePassword:
            return .post
        case .updateProfile:
            return .put
        case .getAddresses:
            return .get
        case .terms:
            return .get
        }
    }
    // MARK: - HTTPTask
    var task: HTTPTask {
        switch self {
        case .login(let email , let password,let lang,let Content_Type):

            return .requestParametersAndHeaders(bodyParameters: ["email":email ,"password":password], bodyEncoding: .jsonEncoding, urlParameters: nil, additionHeaders: ["Content-Type":Content_Type , "lang":lang ], id: nil)
            
        case.regestration(let name, let email,let password, let phone , let image , let lang  , let Content_Type ) :
            return .requestParametersAndHeaders(bodyParameters: ["name":name ,"email":email,"password":password,"phone":phone , "image":image], bodyEncoding: .jsonEncoding, urlParameters: nil, additionHeaders: ["Content-Type":Content_Type , "lang":lang ], id: nil)
            
        case .Home (let  Content_Type , let lang  , let Authorization):
            return.requestParametersAndHeaders(bodyParameters: nil, bodyEncoding: .jsonEncoding, urlParameters: nil, additionHeaders: ["Content-Type":Content_Type , "lang":lang , "Authorization":Authorization ], id: nil)
            
        case .category (let lang):
            return.requestParametersAndHeaders(bodyParameters: nil, bodyEncoding: .jsonEncoding, urlParameters: nil, additionHeaders: [ "lang":lang], id: nil)
            
        case .categoryDetails(let category_id, let  Content_Type , let lang  , let Authorization):
            return .requestParametersAndHeaders(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: ["category_id":category_id], additionHeaders: ["Content-Type":Content_Type , "lang":lang , "Authorization":Authorization ], id: nil)
        case .faqs (let lang):
            return.requestParametersAndHeaders(bodyParameters: nil, bodyEncoding: .jsonEncoding, urlParameters: nil, additionHeaders: [ "lang":lang], id: nil)
 
        case .profile( let Content_Type,  let lang , let Authorization):
            return .requestParametersAndHeaders(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: nil, additionHeaders: ["Content-Type":Content_Type , "lang":lang , "Authorization":Authorization ], id: nil)
         
        case .subCategory (let id , let Content_Type,let lang ,let Authorization ):
            return .requestParametersAndHeaders(bodyParameters: nil, bodyEncoding: .urlappendpath, urlParameters: nil, additionHeaders: ["Content-Type":Content_Type , "lang":lang , "Authorization":Authorization ], id: id)
        case .search( let text, let Content_Type, let lang, let Authorization):
            return .requestParametersAndHeaders(bodyParameters: ["text":text], bodyEncoding: .jsonEncoding, urlParameters: nil, additionHeaders: ["Content-Type":Content_Type , "lang":lang , "Authorization":Authorization ], id: nil)
            
        case .address(name: let name, city: let city, region: let region, details: let details, latitude: let latitude, longitude: let longitude, notes: let notes , Content_Type : let Content_Type , lang : let lang , Authorization : let Authorization):
                        
            return .requestParametersAndHeaders(bodyParameters: ["name":name ,"city":city,"region":region,"details":details , "latitude":latitude,"longitude":longitude,"notes":notes], bodyEncoding:.jsonEncoding, urlParameters: nil, additionHeaders: ["Content-Type" : Content_Type , "lang":lang , "Authorization" : Authorization ], id: nil)
            
        case .changePassword(current_password: let current_password, new_password: let new_password, Content_Type: let Content_Type, lang: let lang, Authorization: let Authorization):
            
            return .requestParametersAndHeaders(bodyParameters: ["current_password":current_password ,"new_password":new_password ], bodyEncoding: .jsonEncoding, urlParameters: nil, additionHeaders: ["Content-Type" : Content_Type , "lang":lang , "Authorization" : Authorization ], id: nil)
            
        case .updateProfile(name: let name, phone: let phone, email: let email, image: let image, Content_Type: let Content_Type, lang: let lang, Authorization: let Authorization):
            
            return .requestParametersAndHeaders(bodyParameters: ["name":name,"phone":phone,"email":email,"image":image], bodyEncoding: .jsonEncoding, urlParameters: nil, additionHeaders: ["Content-Type" : Content_Type , "lang":lang , "Authorization" : Authorization ], id: nil)
            
        case .getAddresses(Content_Type: let Content_Type, lang: let lang, Authorization: let Authorization):
            return .requestParametersAndHeaders(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: nil, additionHeaders: ["Content-Type" : Content_Type , "lang":lang , "Authorization" : Authorization ], id: nil)
            
        case .terms(lang: let lang):
            return .requestParametersAndHeaders(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: nil, additionHeaders: ["lang":lang], id: nil)

        }
    }
    // MARK: - HTTPHeaders
    var headers: HTTPHeaders? {
        
        return nil
    }
 }
