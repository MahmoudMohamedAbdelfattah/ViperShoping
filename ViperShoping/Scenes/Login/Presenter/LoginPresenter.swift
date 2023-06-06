//
//  LoginPresenter.swift
//  ViperShoping
//
//  Created by Mahmoud on 22/06/2023.
//


// asascamba061@gmail.com
// 123!@#qwe
import Foundation


class LoginPresenter : LoginPresenterProtocol  {
 
 // MARK: - Properties
        weak var view: LoginViewProtocol?
        var wireframe: LoginWireFrameProtocol?
        var interactor: LoginInteractorInputProtocol?
    
 // MARK: - Functions
        func signIn(email: String, password: String) {
             interactor?.postLoginRequest(email: email, password: password)
        }
 
        func routeToHomeScreen() {
            wireframe?.presentToHome()
        }
 
        func routeHideIndicatorAndShowAlert(eroorMessage:String) {
            wireframe?.presentAlert(error: eroorMessage)
        }
        func routeToDismiss() {
            wireframe?.dismiss()
        }
}
 
extension LoginPresenter :LoginInteractorOutputProtocol  {
 
  // MARK: - Functions
    func didSignInSucess(){
        self.routeToHomeScreen()
    }
    
    func onError(message: String) {
         self.wireframe?.presentAlert(error: message)
    }
 }

 
