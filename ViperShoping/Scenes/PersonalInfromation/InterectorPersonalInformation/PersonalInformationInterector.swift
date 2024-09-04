//
//  PersonalInformationInterector.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 22/8/2024.
//

import Foundation
 
class PersonalInformationViewInteractor: PersonalInformationInteractorInputProtocol {
  
    // MARK: - Properties
    var outPut: PersonalInformationInteractorOutputProtocol?
    
    // MARK: - Methods
    func didLoadData() {
        NetworkManager.shared.fetchData(T: .profile(Content_Type: NetworkManager.shared.contentType, lang: LanguageHandler.currentLanguage().rawValue , Authorization: Component.shared.getApiToken() ?? "" ), showIndectore: true, responseClass: InformationPersonal.self) { data, error in
             if data?.status == true {
                 self.outPut?.didSignInSucess(data: data ?? InformationPersonal())
             } else {
                self.outPut?.onError(message: data?.message ?? "")
            }
        }
    }
    
    func PostupdateProfile(name: String, email: String, phone: String, image: String) {
        NetworkManager.shared.fetchData(T: .updateProfile(name: name, phone: phone, email: email, image: image, Content_Type: NetworkManager.shared.contentType, lang: LanguageHandler.currentLanguage().rawValue, Authorization: Component.shared.getApiToken() ?? "" ), showIndectore: true, responseClass: UpdateProfile.self) { data, error in
            if data?.status == true {
                self.outPut?.updateProfileSuccess()
           } else {
                self.outPut?.onError(message: data?.message ?? "")
           }
        }
    }
}
    
 
