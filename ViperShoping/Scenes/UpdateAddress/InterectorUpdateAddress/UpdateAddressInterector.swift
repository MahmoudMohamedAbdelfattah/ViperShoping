//
//  UpdateAddressInterector.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 24/8/2024.
//

import Foundation


class UpdateAddressViewInteractor: UpdateAddressInteractorInputProtocol {
  
    // MARK: - Properties
    var outPut: UpdateAddressInteractorOutputProtocol?
   
    // MARK: - Methods
    func didLoadData() {
        NetworkManager.shared.fetchData(T: .getAddresses(Content_Type: NetworkManager.shared.contentType, lang: LanguageHandler.currentLanguage().rawValue , Authorization: Component.shared.getApiToken() ?? "" ), showIndectore: true, responseClass: getAddress.self) { data, error in
             if data?.status == true {
                 self.outPut?.didSignInSucess(data: data ?? getAddress())
            } else {

            }
        }
    }
}
    
 
