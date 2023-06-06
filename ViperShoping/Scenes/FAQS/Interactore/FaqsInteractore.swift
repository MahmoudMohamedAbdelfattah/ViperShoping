//
//  FaqsInteractore.swift
//  ViperShoping
//
//  Created by Mahmoud on 23/07/2023.
//

import Foundation

class FaqsInteractore : FaqsInteractorInputProtocol {
 
    // MARK: - Variables
        var outPut: FaqsInteractorOutputProtocol?
   
    // MARK: - Functions
        func getData() {
            NetworkManager.shared.fetchData(T: .faqs(lang: LanguageHandler.currentLanguage().rawValue), showIndectore: true, responseClass: FaqsModule.self) { data, error in
                if data?.status == true {
                   self.outPut?.getDataSuccessfully(data: data)
                   }else {
                       self.outPut?.getFetchingFailed(withError: data?.message ?? "" )
                  }
               }
        }
   }
   
