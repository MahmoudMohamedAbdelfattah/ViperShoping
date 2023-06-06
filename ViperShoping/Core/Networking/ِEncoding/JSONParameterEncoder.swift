//
//  JSONParameterEncoder.swift
//  ViperShoping
//
//  Created by Mahmoud on 27/06/2023.
//

import Foundation


public struct JSONParameterEncoder {
    
    public func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        do {
            
        // parameter   -> Is the Json we Want to get data from
            // JSONSerialization -> To Convert our json Into Foundation Swift Code
            let jsonAsData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
           // let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
           
            urlRequest.httpBody = jsonAsData
            // Go With header
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        }catch {
            throw NetworkError.encodingFailed
        }
    }
}

