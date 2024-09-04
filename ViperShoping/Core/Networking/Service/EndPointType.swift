//
//  EndPointType.swift
//  ViperShoping
//
//  Created by Mahmoud on 30/06/2024.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}
