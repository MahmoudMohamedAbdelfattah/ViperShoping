//
//  ContractRegister.swift
//  ViperShoping
//
//  Created by Mahmoud on 22/06/2024.
//

import UIKit

protocol SignUpViewProtocol :AnyObject {
        // MARK: - Variables
            var presenter : SignUpViewPresenterProtocol? {get}
        // MARK: - Functions
             func hideLoadingAndShowErrorMessage(error:String)
   }
protocol SignUpViewPresenterProtocol : AnyObject{
        // MARK: - Variables
            var view : SignUpViewProtocol? {get set}
            var wireframe : SignUpWireFrameProtocol? {get set}
            var interactor : SignUpViewInteractorInputProtocol?{get set}
        // MARK: - Functions
            func signUp(fristName: String,lastName: String ,phone:String ,email: String, password: String, confirmPassword: String , image: String)
            func routeToAdressScreen()
            func routeHideIndicatorAndShowAlert(eroorMessage:String)
   }

 protocol SignUpViewInteractorInputProtocol: AnyObject {
        // MARK: - Variables
            var outPut: SignUpViewInteratorOutputProtocol? { get set }
            var remoteDataManager: SignUpRemoteDataManagerInputProtocol? { get set }
            var localDataManager: SignUpLocalDataManagerInputProtocol? { get set }
        // MARK: - Functions
            //Presenter -> Intractor
     func postSignUpRequest(fristName: String, lastName: String, phone: String, email: String, password: String, confirmPassword: String, image :String)
}

protocol SignUpViewInteratorOutputProtocol: AnyObject {
        // MARK: - Functions
            func didSignUpCompleted()
            func onError(message: String)
   }

protocol SignUpRemoteDataManagerInputProtocol: AnyObject{
        // MARK: - Variables
        var remoteRequestHandler: SignUpRemoteDataManagerOutputProtocol? { get set }
        // MARK: - Functions
            // Intractor -> RemoteDataManager
    func postSignUpRequest(fristName: String, lastName: String, phone: String, email: String, password: String, confirmPassword: String , image:String)
}

protocol SignUpRemoteDataManagerOutputProtocol: AnyObject{
         // MARK: - Functions
            //RemoteDataManager -> Intractor
        func onSucessfulSignUp(data: RegisterModule?)
        func messageError(message: String)
}

protocol SignUpLocalDataManagerInputProtocol: AnyObject{
        // MARK: - Functions
            func saveApiToken (token : String) throws
}

extension SignUpLocalDataManagerInputProtocol {
    // MARK: - Methode
        func saveApiToken(token: String) {
            let def = UserDefaults.standard
            def.setValue(token, forKey: "api_token")
            def.synchronize()
        }
}

protocol SignUpWireFrameProtocol: AnyObject {
        // MARK: - Variables
            var viewController : UIViewController?{get set}
 
        // MARK: - Functions
            static func assembleModule() -> UIViewController
            func presentAlert(error:String)
            func pushToAddress()
 }

 
