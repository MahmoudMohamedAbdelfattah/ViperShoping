//
//  ParameterEncoding.swift
//  NetworkLayer
//
//  Created by Malcolm Kumwenda on 2018/03/05.
//  Copyright © 2018 Malcolm Kumwenda. All rights reserved.
//
////////////////////////////////
import Foundation

public typealias Parameters = [String:Any]

//public protocol ParameterEncoder {
//    func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
//}

// Decode Get Requestv  -> Parmeter

// Encode Post Request    -> Body


public enum ParameterEncoding {
    
    case urlEncoding
    case urlappendpath
    case jsonEncoding
    case urlAndJsonEncoding
    
    public func encode(urlRequest: inout URLRequest,bodyParameters: Parameters?,urlParameters: Parameters?,id:Int?) throws {
      print(urlRequest)
        do {
            switch self {
                // Get With paramter
            case .urlEncoding:
                guard let urlParameters = urlParameters else { return }
                try URLParameterEncoder().encode(urlRequest: &urlRequest, with: urlParameters)
                
                // Post -> Body
            case .jsonEncoding:
                guard let bodyParameters = bodyParameters else { return }
                try JSONParameterEncoder().encode(urlRequest: &urlRequest, with: bodyParameters)
               // Post -> Body
                // And With Parmeter
            case .urlAndJsonEncoding:
                guard let bodyParameters = bodyParameters,
                    let urlParameters = urlParameters else { return }
                try URLParameterEncoder().encode(urlRequest: &urlRequest, with: urlParameters)
                try JSONParameterEncoder().encode(urlRequest: &urlRequest, with: bodyParameters)
                print(bodyParameters)
            case .urlappendpath:
                try URLappendPath().appendIDToURL(urlRequest: &urlRequest, id: id ?? Int())
            }
        } catch {
            throw error
        }
    }
}


public enum NetworkError : String, Error {
    case parametersNil = "Parameters were nil."
    case encodingFailed = "Parameter encoding failed."
    case missingURL = "URL is nil."
}
