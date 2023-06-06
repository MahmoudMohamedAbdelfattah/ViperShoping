//
//  AccountPresenter.swift
//  ViperShoping
//
//  Created by Mahmoud on 25/09/2023.
//

import UIKit
 
class AccountPresenter : AccountPresenterProtocol{
 
 
    // MARK: - Variables
    weak var view: AccountViewProtocol?
    var wireframe: AccountWireFrameProtocol?
    var interactor: AccountInteractorInputProtocol?
 
    // MARK: - Methods
     func viewDidLoad() {
          interactor?.getData()
      }
    func routeToView(view: UIViewController) {
        wireframe?.presentToView(view: view)
    }
    func routeToDismiss() {
        wireframe?.dismissView()
    }
    
  }
 
extension  AccountPresenter : AccountInteractorOutputProtocol {
  // MARK: - Methods
    func usersFetchedSuccessfully(data: HomeModel?) {
       
            DispatchQueue.main.async {
                // self.view?.reloadView()
          }
     }
    
    func usersFetchingFailed(withError error: String) {
            wireframe?.alerError(error: error)
     }
}
