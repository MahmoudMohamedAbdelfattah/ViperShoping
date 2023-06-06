//
//  AccountWireFrame.swift
//  ViperShoping
//
//  Created by Mahmoud on 25/09/2023.
//

import UIKit
 class AccountWireFrame : AccountWireFrameProtocol  {
 
// MARK: - Variables
    var viewController: UIViewController?
    
// MARK: - Functions
    static func assembleModule() -> UIViewController {
        let view : AccountViewController = AccountViewController.loadFromNib()
        let wireframe = AccountWireFrame()
        let interactor = AccountInteractor()
        let presenter =  AccountPresenter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        interactor.outPut = presenter
        wireframe.viewController = view
        return view
    }
    
    func presentToView(view: UIViewController) {
         view.modalPresentationStyle = .fullScreen
         viewController?.present(view, animated: true)
    }
 
      func alerError(error: String) {
          DispatchQueue.main.async {
              UIApplication.shared.topViewController?.present(AlertWireFrame.assembleModule(messageError: error ), animated: true)
          }
     }
    
    func dismissView() {
        viewController?.dismiss(animated: true)
     }
}


 
