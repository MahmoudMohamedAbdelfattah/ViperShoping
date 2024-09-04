//
//  SignUpViewInteractor.swift
//  ViperShoping
//
//  Created by Mahmoud on 29/07/2024.
//

import Foundation


class SignUpViewInteractor: SignUpViewInteractorInputProtocol{
     
    // MARK: - Variables
     var outPut: SignUpViewInteratorOutputProtocol?
     var remoteDataManager: SignUpRemoteDataManagerInputProtocol?
     var localDataManager: SignUpLocalDataManagerInputProtocol?
    
    // MARK: - Functions
    func postSignUpRequest(fristName: String, lastName: String, phone: String, email: String, password: String, confirmPassword: String , image:String) {
        remoteDataManager?.postSignUpRequest(fristName: fristName, lastName: lastName, phone: phone, email: email, password: password, confirmPassword: confirmPassword, image:image)
    }
 }

extension SignUpViewInteractor : SignUpRemoteDataManagerOutputProtocol {
    
    // MARK: - Functions
    func onSucessfulSignUp(data: RegisterModule?) {
            do {
                 try localDataManager?.saveApiToken(token: data?.data?.token ?? "")
                }
            catch(_){
              }
        outPut?.didSignUpCompleted()
         }
 
    func messageError(message: String) {
        outPut?.onError(message: message)
    }
}
