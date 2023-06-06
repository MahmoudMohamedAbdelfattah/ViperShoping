////
////  AdressInteractor.swift
////  ViperShoping
////
////  Created by Mahmoud on 23/07/2023.
////
//
import UIKit
import MapKit
import CoreLocation

 
class AddressInteractor: AdressInteractorInputProtocol, LocationDelegate  {

    // MARK: - Variables
    var remoteDataManager: AdressRemoteDataManagerInputProtocol?
    var outPut: AdressInteractorOutputProtocol?
 
    // MARK: - Functions
     func getData() {
        LocationManger.shared.userLocationDelegate = self
     }
    
    func userLocationUpdated(location: CLLocation) {
        outPut?.locationDataFetched(location: location )

    }
    
    func SaveAddress(name: String, city: String, region: String, details: String, latitude: Double, longitude: Double, notes: String, Content_Type: String, lang: String, Authorization: String) {
        remoteDataManager?.SaveAddress(name: name, city: city, region: region, details: details, latitude: latitude, longitude: longitude, notes: notes, Content_Type: Content_Type, lang: lang, Authorization: Authorization)
    }
 
}


extension AddressInteractor : AddressRemoteDataManagerOutputProtocol {
   
    // MARK: - Functions
    func onSucessfulSignUp(data: AddresModel?) {
        outPut?.didSignUpCompleted()
    }
    
    func messageError(message: String) {
        outPut?.onError(message: message)
    }
    
    
}
