//
//  SlidMenuPresenter.swift
//  ViperShoping
//
//  Created by Mahmoud on 10/09/2023.
//

import UIKit
 
class SlidMenuPresenter : SlidMenuPresenterProtocol  {
 
 // MARK: - Properties
        weak var view: SlidMenuViewProtocol?
        var wireframe: SlidMenuWireFrameProtocol?
        var interactor: SlidMenuInteractorInputProtocol?
        var personalInformation: PersonalData?
    
 // MARK: - Functions
        func getInfo(token: String) {
            interactor?.postPresonalInfo(token: token)
        }
  
        func routeHideIndicatorAndShowAlert(eroorMessage:String) {
            wireframe?.HideIndicatorAndShowAlertError(messageErore:eroorMessage)
        }
    
        func routeToView(view: UIViewController) {
            wireframe?.presentToView(view: view)
    }
 }
 
extension SlidMenuPresenter :SlidMenuInteractorOutputProtocol  {
   
  // MARK: - Functions
    func didSignInSucess(data: InformationPersonal) {
        self.personalInformation = data.data
 
        view?.updateProfileImage(image: self.personalInformation?.image ?? "", name: self.personalInformation?.name ?? "" )
        
        view?.updateProfileImage(image: self.personalInformation?.image ?? "", name: self.personalInformation?.name ?? "")
    }
        func onError(message: String) {
            view?.hideLoadingAndShowErrorMessage(error: message)
        }
 }

 
