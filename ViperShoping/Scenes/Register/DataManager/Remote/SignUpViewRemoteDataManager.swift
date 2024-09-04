//
//  SignUpViewRemoteDataManager.swift
//  ViperShoping
//
//  Created by Mahmoud on 29/07/2024.
//

import UIKit


class SignUpViewRemoteDataManager : SignUpRemoteDataManagerInputProtocol {
   
// MARK: - Variables
    var remoteRequestHandler: SignUpRemoteDataManagerOutputProtocol?
    
// MARK: - Methode
    func postSignUpRequest(fristName: String, lastName: String, phone: String, email: String, password: String, confirmPassword: String , image:String) {
         
        NetworkManager.shared.fetchData(T: .regestration(name: "\(fristName)", email: email, password: password, phone: phone, image: image , lang: LanguageHandler.currentLanguage().rawValue, Content_Type: NetworkManager.shared.contentType), showIndectore: true, responseClass: RegisterModule.self) { data, error in
            print(RegisterModule.self)
               if data?.status == true {
                 self.remoteRequestHandler?.onSucessfulSignUp(data: data ?? RegisterModule())
             
             }else {
            
                self.remoteRequestHandler?.messageError(message: data?.message ?? "")
            }
         }
    }
 }
