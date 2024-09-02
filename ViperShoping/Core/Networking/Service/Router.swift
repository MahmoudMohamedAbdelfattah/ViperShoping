//
//  Router.swift
//  ViperShoping
//
//  Created by Mahmoud on 27/06/2023.
//

 

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

protocol NetworkRouter: AnyObject {
    associatedtype EndPoint: EndPointType
   
    func request( route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}



class Router<EndPoint: EndPointType>: NetworkRouter {
    
    private var task: URLSessionTask?

    func request(route: EndPoint, completion: @escaping NetworkRouterCompletion) {
        let session = URLSession.shared
        do {
            let request = try self.buildRequest(from: route)
             NetworkLogger.log(request: request)
             task = session.dataTask(with: request, completionHandler: { data, response, error in
                completion(data, response, error)
                
            })
        }catch {
            completion(nil, nil, error)
        }
        self.task?.resume()
    }

    
    func cancel() {
        self.task?.cancel()
    }
    
    
    
    
    fileprivate func buildRequest(from route: EndPoint) throws -> URLRequest {
        
        var request = URLRequest(url: route.baseURL.appendingPathComponent(route.path),
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 60)
        
        request.httpMethod = route.httpMethod.rawValue
        do {
            switch route.task {
                
            case .request:
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                
            case .requestParameters(let bodyParameters,let bodyEncoding,let urlParameters, let id):
                
                try self.configureParameters(bodyParameters: bodyParameters,
                                             bodyEncoding: bodyEncoding,
                                             urlParameters: urlParameters, id: id,
                                             request: &request)
                
                
            case .requestParametersAndHeaders(let bodyParameters,
                                              let bodyEncoding,
                                              let urlParameters,
                                              let additionalHeaders,let id):
                
                self.addAdditionalHeaders(additionalHeaders, request: &request)
                
                try self.configureParameters(bodyParameters: bodyParameters,
                                             bodyEncoding: bodyEncoding,
                                             urlParameters: urlParameters, id: id,
                                             request: &request)
           
                
                
            }
            return request
        } catch {
            throw error
        }
    }
    
    
    fileprivate func configureParameters(bodyParameters: Parameters?,
                                         bodyEncoding: ParameterEncoding,
                                         urlParameters: Parameters?,id:Int?,
                                         request: inout URLRequest) throws {
        do {
            try bodyEncoding.encode(urlRequest: &request,
                                    bodyParameters: bodyParameters, urlParameters: urlParameters, id: id)
        } catch {
            throw error
        }
    }
    
    
    fileprivate func addAdditionalHeaders(_ additionalHeaders: HTTPHeaders?, request: inout URLRequest) {
        guard let headers = additionalHeaders else { return }
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
    
}








//    func requestt( route: EndPoint , completion: @escaping NetworkRouterCompletion) {
//        let session = URLSession.shared
//        do {
//            let request = try self.buildRequest(from: route)
//            NetworkLogger.log(request: request)
//            task = session.dataTask(with: request, completionHandler: { data, response, error in
//                completion(data, response, error)
//
//
//            })
//        }catch {
//            completion(nil, nil, error)
//        }
//        self.task?.resume()
//    }

//    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion) {
//        let session = URLSession.shared
//        do {
//            let request = try self.buildRequest(from: route)
//            NetworkLogger.log(request: request)
//            task = session.dataTask(with: request, completionHandler: { data, response, error in
//                completion(data, response, error)
//
//
//            })
//        }catch {
//            completion(nil, nil, error)
//        }
//        self.task?.resume()
//    }

