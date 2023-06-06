//
//  UpdateAddressPresenter.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 24/8/2024.
//

import Foundation
 
class UpdateAddressViewPresenter : UpdateAddressPresenterProtocol {
  
    // MARK: - Properties
    var view: UpdateAddressViewProtocol?
    var wireframe: UpdateAddressWireFrameProtocol?
    var interactor: UpdateAddressInteractorInputProtocol?
    
    // MARK: - Methods
    func PostdidLoadData() {
        interactor?.didLoadData()
    }
    
    func dismissView(){
        wireframe?.dismiss()
    }
}

extension UpdateAddressViewPresenter :  UpdateAddressInteractorOutputProtocol {
   
    // MARK: - Methods
 func didSignInSucess(data: getAddress) {
        
        var data = data.data?.data.last
        DispatchQueue.main.async {
            self.view?.data(name: data?.name ?? "", city: data?.city ?? "", region: data?.region ?? "", details: data?.details ?? "")
            }
        }
    }
    
 
