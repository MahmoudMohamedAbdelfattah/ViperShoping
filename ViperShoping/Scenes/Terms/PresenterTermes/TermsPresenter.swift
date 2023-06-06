//
//  TermsPresenter.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 27/8/2024.
//

import Foundation

 
class TermsViewPresenter : TermsPresenterProtocol {
  
    // MARK: - Properties
    var view: TermsViewProtocol?
    var wireframe: TermsWireFrameProtocol?
    var interactor: TermsInteractorInputProtocol?
    
    // MARK: - Methods
    func PostdidLoadData() {
        interactor?.didLoadData()
    }
    
    func dismissView(){
        wireframe?.dismiss()
    }    
}

extension TermsViewPresenter :  TermsInteractorOutputProtocol {
    
    // MARK: - Methods
    func didSignInSucess(data: Terms) {
        DispatchQueue.main.async {
            self.view?.data(about: data.data?.about ?? "", terms: data.data?.terms ?? "")
            }
        }
    }
    
 
