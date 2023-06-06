//
//  CategoryInteractor.swift
//  ViperShoping
//
//  Created by Mahmoud on 17/07/2023.
//

import Foundation

 class CategoryInteractor : CategoryInteractorInputProtocol {
  
     // MARK: - Variables
        var outPut: CategoryInteractorOutputProtocol?
    
     // MARK: - Functions
         func getData() {
             NetworkManager.shared.fetchData(T: .category(lang: LanguageHandler.currentLanguage().rawValue), showIndectore: true, responseClass: CategoryModel.self) { data, error in
                  if data?.status == true {
                     self.outPut?.getDataSuccessfully(data: data)
                    } else {
                       self.outPut?.getFetchingFailed(withError: data?.message ?? "" )
                   }
                }
             }
     }
    
 
