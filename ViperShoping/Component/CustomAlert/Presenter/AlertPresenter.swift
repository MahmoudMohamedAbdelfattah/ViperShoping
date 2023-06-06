//
//  AlertPresenter.swift
//  ViperShoping
//
//  Created by Mahmoud on 09/07/2023.
//

import Foundation

class AlertPresenter : AlertPresenterProtocol {
    func dismissView() {
        router?.dissmiss()
    }
    
   
 // MARK: - Variables
    weak  var view: AlertViewProtocol?
    var router: AlertWireFrameProtocol?
    var interactor: AlertInteractorInputProtocol?
    var message: String?
 
 // MARK: - Initializers
        init(view:AlertViewProtocol , router:AlertWireFrameProtocol , interactor: AlertInteractorInputProtocol){
            self.view = view
            self.router = router
            self.interactor = interactor
        }
// MARK: - Functions
      func didLoad() {
         interactor?.getData()
    }
 }
 
extension AlertPresenter : AlertInteractorOutputProtocol {
  
// MARK: - Functions
    func erroreMessage(error: String?) {
        self.message = error
         print(self.message ?? "")
    }
}
