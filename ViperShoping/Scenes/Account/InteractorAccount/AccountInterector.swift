//
//  AccountInterector.swift
//  ViperShoping
//
//  Created by Mahmoud on 25/09/2023.
//

import Foundation

class AccountInteractor : AccountInteractorInputProtocol {
      // MARK: - Variables
     var outPut: AccountInteractorOutputProtocol?
    
    // MARK: - Functions
     func getData() {
         NetworkManager.shared.fetchData(T: .Home(Content_Type: NetworkManager.shared.contentType, lang: LanguageHandler.currentLanguage().rawValue, Authorization: Component.shared.getApiToken() ?? ""), showIndectore: true, responseClass: HomeModel.self) { data, error in
              if data?.status == true {
                    self.outPut?.usersFetchedSuccessfully(data: data)
                }else {
                   self.outPut?.usersFetchingFailed(withError: data?.message ?? "" )
               }
            }
         }
    }
    
 
