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
        let presenter =  AccountPresenter()
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = wireframe
        wireframe.viewController = view
        return view
    }
    
    func presentToView(view: UIViewController) {
         view.modalPresentationStyle = .fullScreen
         viewController?.present(view, animated: true)
    }
 
    func dismissView() {
        viewController?.dismiss(animated: true)
     }
}


 
