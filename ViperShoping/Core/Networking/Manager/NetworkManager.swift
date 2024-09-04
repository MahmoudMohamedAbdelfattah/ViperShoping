//
//  NetworkManager.swift
//  NetworkLayer
//
//  Created by Mahmoud on 30/06/2024.

import UIKit

enum NetworkResponse:String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

enum Result<String>{
    case success
    case failure(String)
}

class NetworkManager :Router<NetworkEnvironment> {
 
    static let shared : NetworkManager = NetworkManager()
    
    var contentType = "application/json"
    
    func fetchData<M:Codable>(T:NetworkEnvironment,showIndectore:Bool,responseClass: M.Type, completion: @escaping (_ success:M?,_ error: String?)->()){
        
        if showIndectore {
                    DispatchQueue.main.async {
                        UIApplication.getTopMostViewControllerr()?.present(IndicatorWireFrame.assembleModule(), animated: true)
                    }
        }

        
        self.request(route: T) { data, response, error in
            if showIndectore {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    UIApplication.getTopMostViewControllerr()?.dismiss(animated: true)
                }
            }
            print(response)
            if error != nil {
                 completion(nil, "Please check your network connection.")
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                 }
                let result = self.handleNetworkResponse(response)
                print(result)
             
                switch result {
                    
                case .success:
                     guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }

                    do {
//
                        
                            let decoder = JSONDecoder()
                            let apiResponse = try decoder.decode(M.self, from: responseData)
                            completion(apiResponse,nil)
                     
                        }catch {
 
                            completion(nil, NetworkResponse.unableToDecode.rawValue)
                     
                    }
                case .failure(let networkFailureError):
                   // IndicatorRouter.assembleModule().dismiss(animated: true)
              print(networkFailureError)
//
                    completion(nil, networkFailureError)
               
                }
            }
        }
    }
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String>{
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
