//
//  ContractLogin.swift
//  ViperShoping
//
//  Created by Mahmoud on 22/06/2023.
//

import UIKit
 
  protocol LoginViewProtocol :AnyObject {
      
// MARK: - Variables
        var presenter : LoginPresenterProtocol? {get}
 // MARK: - Functions
        func hideLoadingAndShowErrorMessage(error:String)
   }

 protocol LoginPresenterProtocol : AnyObject{
// MARK: - Variables
        var view : LoginViewProtocol? {get set}
        var wireframe : LoginWireFrameProtocol? {get set}
        var interactor : LoginInteractorInputProtocol? {get set}
 // MARK: - Functions
        func signIn(email: String, password: String)
        func routeToHomeScreen()
        func routeToDismiss()
        func routeHideIndicatorAndShowAlert(eroorMessage:String)
     }

protocol LoginInteractorInputProtocol : AnyObject {
// MARK: - Variables
        var outPut: LoginInteractorOutputProtocol? {get set}
        var remoteDataManager: LoginViewRemoteDataManagerInputProtocol?{ get set }
 // MARK: - Functions
         func postLoginRequest(email: String, password: String)
    }
 
protocol LoginInteractorOutputProtocol : AnyObject {
// MARK: - Functions
         func onError(message: String)
         func didSignInSucess()
     }

protocol LoginViewRemoteDataManagerInputProtocol: AnyObject{
    var remoteRequestHandler: LoginViewRemoteDataManagerOutputProtocol? { get set }
     // Intractor -> RemoteDataManager
    func postLoginRequest(email: String, password: String)
    }

protocol LoginViewRemoteDataManagerOutputProtocol: AnyObject{
    //Remote Data Manager -> Intractor
     func messageError(message: String)
    func signInSucess(data : LoginModel)
    }

protocol LoginWireFrameProtocol: AnyObject {
// MARK: - Variables
        var viewController : UIViewController?{get set}
// MARK: - Functions
        static func assembleModule() -> UIViewController
        func presentAlert(error:String)
        func presentToHome()
        func dismiss()
      }
