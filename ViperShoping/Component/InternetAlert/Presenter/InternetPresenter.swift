//
//  InternetPresenter.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 27/6/2024.
//

import Foundation

class InternetPresenter : InternetPresenterProtocol {
  
   
 // MARK: - Variables
    weak  var view: InternetViewProtocol?
    var router: InternetWireFrameProtocol?
    var interactor: InternetInteractorInputProtocol?
    var message: String?

// MARK: - Functions
      func didLoad() {
         interactor?.getData()
    }
    
    func routeToDismiss() {
        router?.dismiss()
     }
  }
 
extension InternetPresenter : InternetInteractorOutputProtocol {
  
// MARK: - Functions
    func erroreMessage(error: String?) {
        self.message = error
         print(self.message ?? "")
    }
}
