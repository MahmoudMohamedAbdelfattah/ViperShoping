//
//  ContractAdress.swift
//  ViperShoping
//
//  Created by Mahmoud on 23/07/2023.
//
 

import UIKit
import MapKit

protocol AdressViewProtocol :AnyObject {
    
    // MARK: - Variables
    var presenter : AdressPresenterProtocol? {get}
    var resultSearchController:UISearchController? { get }
    // MARK: - Functions
    func locationFetched(location: CLLocation)
 }
protocol AdressPresenterProtocol : AnyObject{
    
// MARK: - Variables
    var view : AdressViewProtocol? {get set}
    var wireframe : AdressWireFrameProtocol? {get set}
    var interactor : AdressInteractorInputProtocol?{get set}
 
// MARK: - Functions
    func viewDidLoad()
    func postSaveAddress(name : String , city:String , region:String , details : String ,latitude: Double , longitude:Double , notes: String , Content_Type : String , lang : String , Authorization : String)
 
   }

protocol AdressInteractorInputProtocol : AnyObject {
// MARK: - Variables
   var outPut: AdressInteractorOutputProtocol? { get set }
    var remoteDataManager: AdressRemoteDataManagerInputProtocol? { get set }
// MARK: - Functions
    func getData()
    func SaveAddress(name : String , city:String , region:String , details : String ,latitude: Double , longitude:Double , notes: String , Content_Type : String , lang : String , Authorization : String )
}

protocol AdressRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: AddressRemoteDataManagerOutputProtocol? { get set }
     func SaveAddress(name : String , city:String , region:String , details : String ,latitude: Double , longitude:Double , notes: String ,Content_Type : String , lang : String , Authorization : String )
}

protocol AddressRemoteDataManagerOutputProtocol: AnyObject{
         // MARK: - Functions
        func onSucessfulSignUp(data: AddresModel?)
        func messageError(message: String)
}

protocol AdressInteractorOutputProtocol: AnyObject {
   
// MARK: - Functions
    func locationDataFetched(location: CLLocation)
    func didSignUpCompleted()
    func onError(message: String)
 }
 
 
protocol AdressWireFrameProtocol: AnyObject {
    
// MARK: - Variables
   var viewController : UIViewController?{get set}
// MARK: - Functions
 
    static func assembleModule() -> UIViewController 
    func  pushToHome()
    func presentAlert(error: String)
 
 }
