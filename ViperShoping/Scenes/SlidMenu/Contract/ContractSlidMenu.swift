//
//  ContractSlidMenu.swift
//  ViperShoping
//
//  Created by Mahmoud on 10/09/2023.
//
 
import UIKit
 
  protocol SlidMenuViewProtocol :AnyObject {
      
// MARK: - Variables
        var presenter : SlidMenuPresenterProtocol? {get}
 // MARK: - Functions
       func updateProfileImage(image: String , name:String )
   }

 protocol SlidMenuPresenterProtocol : AnyObject{
// MARK: - Variables
        var view : SlidMenuViewProtocol? {get set}
        var wireframe : SlidMenuWireFrameProtocol? {get set}
        var interactor : SlidMenuInteractorInputProtocol? {get set}
        var personalInformation : PersonalData? { get }
 // MARK: - Functions
        func routeToView(view:UIViewController)
        func getInfo(token: String)
        func routeHideIndicatorAndShowAlert(eroorMessage:String)
     }

protocol SlidMenuInteractorInputProtocol : AnyObject {
// MARK: - Variables
        var outPut: SlidMenuInteractorOutputProtocol? {get set}
        var remoteDataManager: SlidMenuViewRemoteDataManagerInputProtocol?{ get set }
 // MARK: - Functions
         func postPresonalInfo(token: String)
     }
 
protocol SlidMenuInteractorOutputProtocol : AnyObject {
// MARK: - Functions
         func onError(message: String)
         func didSignInSucess(data : InformationPersonal)
     }

protocol SlidMenuViewRemoteDataManagerInputProtocol: AnyObject{
        var remoteRequestHandler: SlidMenuViewRemoteDataManagerOutputProtocol? { get set }
     // Intractor -> RemoteDataManager
        func postInfoRequest(token: String)
    }

protocol SlidMenuViewRemoteDataManagerOutputProtocol: AnyObject{
    //Remote Data Manager -> Intractor
        func messageError(message: String)
        func signInSucess(data : InformationPersonal)
    }

protocol SlidMenuWireFrameProtocol: AnyObject {
// MARK: - Variables
        var viewController : UIViewController?{get set}
// MARK: - Functions
        static func assembleModule(token:String) -> UIViewController
        func presentToView(view:UIViewController)
        func dismiss()
        func HideIndicatorAndShowAlertError(messageErore: String)
     }
