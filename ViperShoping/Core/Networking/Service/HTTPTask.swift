//
//  HTTPTask.swift
//  ViperShoping
//
//  Created by Mahmoud on 27/06/2023.
//

import Foundation


public typealias HTTPHeaders = [String:String]

public enum HTTPTask {
   
    case request
    
    case requestParameters(bodyParameters: Parameters?,
        bodyEncoding: ParameterEncoding,
                           urlParameters: Parameters?,id:Int?)
    
    case requestParametersAndHeaders(bodyParameters: Parameters?,
        bodyEncoding: ParameterEncoding,
        urlParameters: Parameters?,
        additionHeaders: HTTPHeaders?,id:Int?)
    
     
    
    // case download, upload...etc
 }
