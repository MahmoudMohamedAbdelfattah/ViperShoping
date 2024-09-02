//
//  PersonalInformationPresenter.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 22/8/2024.
//

import Foundation

class PersonalInformationViewPresenter : PersonalInformationPresenterProtocol {
  
    // MARK: - Properties
    var view: PersonalInformationViewProtocol?
    var wireframe: PersonalInformationWireFrameProtocol?
    var interactor: PersonalInformationInteractorInputProtocol?
    
    // MARK: - Methods
    func PostdidLoadData() {
        interactor?.didLoadData()
    }
    
    func updateProfile(name: String, email: String, phone: String, image: String) {
        interactor?.PostupdateProfile(name: name, email: email, phone: phone, image: image)
    }
}

extension PersonalInformationViewPresenter :  PersonalInformationInteractorOutputProtocol {
    func updateProfileSuccess() {
        wireframe?.dismiss()
    }
    
    func onError(message: String) {
        wireframe?.presentAlert(error: message)
    }
    
    func didSignInSucess(data: InformationPersonal) {
        DispatchQueue.main.async {
            self.view?.data(name: data.data?.name ?? "", email: data.data?.email ?? "", phone: data.data?.phone ?? "", image: data.data?.image ?? "")
        }
    }
}
