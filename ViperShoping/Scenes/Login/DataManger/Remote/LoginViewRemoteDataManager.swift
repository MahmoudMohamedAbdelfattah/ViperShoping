//
//  LoginViewRemoteDataManager.swift
//  ViperShoping
//
//  Created by Mahmoud on 30/07/2023.
//

import Foundation


class LoginViewRemoteDataManager: LoginViewRemoteDataManagerInputProtocol{

// MARK: - Properties
    var remoteRequestHandler: LoginViewRemoteDataManagerOutputProtocol?
    
// MARK: - Methods
    func postLoginRequest(email: String, password: String) {
        NetworkManager.shared.fetchData(T: .login(email: email, password: password, lang: LanguageHandler.currentLanguage().rawValue, Content_Type: NetworkManager.shared.contentType), showIndectore: true, responseClass: LoginModel.self) { data, error in
             if data?.status == true {
                self.remoteRequestHandler?.signInSucess(data: data ?? LoginModel())
            } else {
                self.remoteRequestHandler?.messageError(message: data?.message ?? "")
            }
         }
     }
  }
