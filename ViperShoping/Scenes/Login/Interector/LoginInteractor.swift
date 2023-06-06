//
//  LoginInteractor.swift
//  ViperShoping
//
//  Created by Mahmoud on 11/07/2023.
//

import Foundation

class LoginInteractor : LoginInteractorInputProtocol {
 
// MARK: - Properties
        var outPut: LoginInteractorOutputProtocol?
        var remoteDataManager: LoginViewRemoteDataManagerInputProtocol?

// MARK: - Methods
        func postLoginRequest(email: String, password: String) {
            remoteDataManager?.postLoginRequest(email: email, password: password)
        }
 }

extension  LoginInteractor : LoginViewRemoteDataManagerOutputProtocol {
  
 // MARK: - Methods
        func messageError(message: String) {
                outPut?.onError(message: message)
        }
    
        func signInSucess(data: LoginModel) {
 
                let def = UserDefaults.standard
                def.setValue(data.data?.token, forKey: "api_token")
                def.synchronize()
                outPut?.didSignInSucess()
        }
    }
    
 
