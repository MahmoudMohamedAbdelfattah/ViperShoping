//
//  NewPhonePresenter.swift
//  ViperShoping
//
//  Created by Mahmoud on 25/09/2023.
//

import UIKit


class ChangePhonePresenter : ChangePhonePresenterProtocol{
    
    // MARK: - Variables
    weak var view: ChangePhoneViewProtocol?
    var wireframe: ChangePhoneWireFrameProtocol?
    var interactor: ChangePhoneInteractorInputProtocol?
 
    
    // MARK: - Initializers
    init(view:ChangePhoneViewProtocol,wireframe:ChangePhoneWireFrameProtocol,interactor:ChangePhoneInteractorInputProtocol){
        self.view = view
        self.wireframe = wireframe
        self.interactor = interactor
    }
    
    // MARK: - Methods
     func viewDidLoad() {
          interactor?.getData()
      }
  }
 
extension  ChangePhonePresenter : ChangePhoneInteractorOutputProtocol {
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
