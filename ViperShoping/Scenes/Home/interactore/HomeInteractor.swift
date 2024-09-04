//
//  HomeInteractor.swift
//  ViperShoping
//
//  Created by Mahmoud on 08/07/2024.
//

import UIKit

 class HomeInteractor : HomeInteractorInputProtocol {
      // MARK: - Variables
     var outPut: HomeInteractorOutputProtocol?
    
    // MARK: - Functions
     func getData() {
         NetworkManager.shared.fetchData(T: .Home(Content_Type: NetworkManager.shared.contentType, lang: LanguageHandler.currentLanguage().rawValue, Authorization: Component.shared.getApiToken() ?? ""), showIndectore: false, responseClass: HomeModel.self) { data, error in
              if data?.status == true {
                    self.outPut?.getDataSuccessfully(data: data)
                }else {
                   self.outPut?.getFetchingFailed(withError: data?.message ?? "" )
               }
            }
         }
    }
    
 
