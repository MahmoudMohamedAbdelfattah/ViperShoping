//
//  RegisterPresnter.swift
//  ViperShoping
//
//  Created by Mahmoud on 22/06/2024.
//

import Foundation

class SignUpViewPresenter : SignUpViewPresenterProtocol {
 
// MARK: - Variables
    weak  var view: SignUpViewProtocol?
    var wireframe: SignUpWireFrameProtocol?
    var interactor: SignUpViewInteractorInputProtocol?

// MARK: - Functions
    func signUp(fristName: String, lastName: String, phone: String, email: String, password: String, confirmPassword: String , image: String) {
         if password == confirmPassword {
             interactor?.postSignUpRequest(fristName: fristName, lastName: lastName, phone: phone, email: email, password: password, confirmPassword: confirmPassword,image:image)
            }
         else   {
             view?.hideLoadingAndShowErrorMessage(error: "Password do not match")
            }
        }
   
        func routeToAdressScreen() {
            wireframe?.pushToAddress()
        }
 
        func routeHideIndicatorAndShowAlert(eroorMessage:String) {
            wireframe?.presentAlert(error: eroorMessage)
        }
  }

extension SignUpViewPresenter: SignUpViewInteratorOutputProtocol{
     
    func didSignUpCompleted() {
        self.routeToAdressScreen()
      }

    func onError(message: String) {
         self.wireframe?.presentAlert(error: message)
    }
    
 
 }
