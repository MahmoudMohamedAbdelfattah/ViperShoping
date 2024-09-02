//
//  InternetWireFrame.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 27/6/2024.
//

import Foundation
import UIKit


class InternetWireFrame : InternetWireFrameProtocol{
    
 // MARK: - Variables
     var viewController: UIViewController?
    
// MARK: - Functions
    static func assembleModule() -> UIViewController {
        let view : DisconnectInternetViewController = DisconnectInternetViewController()
        let router = InternetWireFrame()
        let interactor = InternetInteractor()
        let presenter = InternetPresenter()
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.output = presenter
         router.viewController = view
         return view
    }
    
    func dismiss() {
       // viewController?.navigationController?.popViewController(animated: true)
    }
 }

 
