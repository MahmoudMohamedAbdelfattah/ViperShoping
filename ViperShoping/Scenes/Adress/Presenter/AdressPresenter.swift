//
//  AdressPresenter.swift
//  ViperShoping
//
//  Created by Mahmoud on 23/07/2023.
//


import UIKit
 import MapKit

class AdressPresenter : AdressPresenterProtocol{

    
 
    

// MARK: - Variables
    weak var view: AdressViewProtocol?
    var wireframe: AdressWireFrameProtocol?
    var interactor: AdressInteractorInputProtocol?
    var allProductCategory: [DataInfo]?
    
    var address: String?
    var city: String?
    var country: String?
    var region: String?
    
// MARK: - Initializers
//    init(view:AdressViewProtocol,wireframe:AdressWireFrameProtocol,interactor:AdressInteractorInputProtocol){
//        self.view = view
//        self.wireframe = wireframe
//        self.interactor = interactor
//        
//    }
 // MARK: - Methods
     func viewDidLoad() {
      //   view?.showIndicator()
         interactor?.getData()
     }
    
// MARK: - Functions
 
    
    func postSaveAddress(name: String, city: String, region: String, details: String, latitude: Double, longitude: Double, notes: String, Content_Type : String , lang : String , Authorization : String) {
        
        interactor?.SaveAddress(name: name, city: city, region: region, details: details, latitude: latitude, longitude: longitude, notes: notes, Content_Type : Content_Type , lang : lang , Authorization : Authorization)
    }
 }
 
extension  AdressPresenter : AdressInteractorOutputProtocol {

    
    func locationDataFetched(location: CLLocation) {
        view?.locationFetched(location: location)
    }
 
    func didSignUpCompleted() {
        wireframe?.pushToHome()
    }
    
    func onError(message: String) {
        wireframe?.presentAlert(error: message)
    }
  
}
