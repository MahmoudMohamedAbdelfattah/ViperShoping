//
//  AccountPresenter.swift
//  ViperShoping
//
//  Created by Mahmoud on 25/09/2024.
//

import UIKit
 
class AccountPresenter : AccountPresenterProtocol{
 
     // MARK: - Variables
    weak var view: AccountViewProtocol?
    var wireframe: AccountWireFrameProtocol?
    
      // MARK: - Methods
     func routeToView(view: UIViewController) {
        wireframe?.presentToView(view: view)
    }
    func routeToDismiss() {
        wireframe?.dismissView()
    }
 }
 
 
