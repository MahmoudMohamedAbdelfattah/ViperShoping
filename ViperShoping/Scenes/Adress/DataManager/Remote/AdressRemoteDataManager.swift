//
//  AdressRemoteDataManager.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 21/8/2024.
//

  import UIKit
 
class AdressRemoteDataManager : AdressRemoteDataManagerInputProtocol {
 
// MARK: - Variables
     var remoteRequestHandler: AddressRemoteDataManagerOutputProtocol?

// MARK: - Methode
    func SaveAddress(name: String, city: String, region: String, details: String, latitude: Double, longitude: Double, notes: String, Content_Type: String, lang: String, Authorization: String) {
 
        NetworkManager.shared.fetchData(T: .address(name: name, city: city, region: region, details: details, latitude: latitude, longitude: longitude, notes: notes, Content_Type: Content_Type, lang: lang, Authorization: Authorization), showIndectore: true, responseClass: AddresModel.self) { data, error in
            
            if data?.status == true {
                self.remoteRequestHandler?.onSucessfulSignUp(data: data ?? AddresModel())
            } else {
                 self.remoteRequestHandler?.messageError(message: data?.message ?? "")
            }
        }
    }
 }
