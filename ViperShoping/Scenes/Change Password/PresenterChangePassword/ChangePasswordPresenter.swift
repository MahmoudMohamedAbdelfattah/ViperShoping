//
//  ChangePasswordPresenter.swift
//  ViperShoping
//
//  Created by Mahmoud on 25/09/2024.
//

import Foundation
 
class ChangePasswordPresenter : ChangePasswordPresenterProtocol{
     // MARK: - Variables
    weak var view: ChangePasswordViewProtocol?
    var wireframe: ChangePasswordWireFrameProtocol?
    var interactor: ChangePasswordInteractorInputProtocol?
    
    // MARK: - Methods
    func postChangePassword(current_password: String, new_password: String, Content_Type: String, lang: String, Authorization: String) {
        interactor?.changePassword(current_password: current_password, new_password: new_password, Content_Type: Content_Type, lang: lang, Authorization: Authorization)
    }
    
    func dismiss() {
        wireframe?.dismiss()
    }
 }
 
extension  ChangePasswordPresenter : ChangePasswordInteractorOutputProtocol {
  // MARK: - Methods
    func usersFetchedSuccessfully(data: ChangePassword?) {
        self.wireframe?.dismiss()
     }
    
    func usersFetchingFailed(withError error: String) {
        self.wireframe?.presentAlert(error: error)
     }
}
