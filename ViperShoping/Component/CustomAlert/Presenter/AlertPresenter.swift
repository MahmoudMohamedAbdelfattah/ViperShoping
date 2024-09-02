//
//  AlertPresenter.swift
//  ViperShoping
//
//  Created by Mahmoud on 09/07/2023.
//

import Foundation

class AlertPresenter : AlertPresenterProtocol {

 // MARK: - Variables
    weak  var view: AlertViewProtocol?
    var router: AlertWireFrameProtocol?
    var interactor: AlertInteractorInputProtocol?
    var message: String?
 
// MARK: - Functions
      func didLoad() {
         interactor?.getData()
    }
    
    func dismissView() {
        router?.dissmiss()
    }
 }
 
extension AlertPresenter : AlertInteractorOutputProtocol {
  
// MARK: - Functions
    func erroreMessage(error: String?) {
        self.message = error
         print(self.message ?? "")
    }
}
