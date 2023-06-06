//
//  TermsInterector.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 27/8/2024.
//

import Foundation



class TermsViewInteractor: TermsInteractorInputProtocol {
  
    // MARK: - Variables
    var outPut: TermsInteractorOutputProtocol?
    
    // MARK: - Methods
    func didLoadData() {
        NetworkManager.shared.fetchData(T: .terms(lang: LanguageHandler.currentLanguage().rawValue), showIndectore: true, responseClass: Terms.self) { data, error in
                if data?.status == true {
                    self.outPut?.didSignInSucess(data: data ?? Terms())
                } else {
            }
        }
    }
}
    
 
