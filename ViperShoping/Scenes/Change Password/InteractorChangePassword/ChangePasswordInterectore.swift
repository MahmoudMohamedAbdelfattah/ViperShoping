//
//  ChangePasswordInterectore.swift
//  ViperShoping
//
//  Created by Mahmoud on 25/09/2024.
//

import Foundation

class ChangePasswordInterectore : ChangePasswordInteractorInputProtocol {
      // MARK: - Variables
     var outPut: ChangePasswordInteractorOutputProtocol?
    
    // MARK: - Functions
    func changePassword(current_password: String ,new_password: String, Content_Type: String, lang: String, Authorization: String) {
        NetworkManager.shared.fetchData(T: .changePassword(current_password: current_password, new_password: new_password, Content_Type: Content_Type, lang: lang, Authorization: Authorization), showIndectore: true, responseClass: ChangePassword.self) { data, error in
              if data?.status == true {
                    self.outPut?.usersFetchedSuccessfully(data: data)
                }else {
                   self.outPut?.usersFetchingFailed(withError: data?.message ?? "" )
               }
            }
         }
    }
    
 
