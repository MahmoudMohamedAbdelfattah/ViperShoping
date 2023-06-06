//
//  AlertRouter.swift
//  ViperShoping
//
//  Created by Mahmoud on 09/07/2023.
//

import UIKit


class AlertWireFrame : AlertWireFrameProtocol{
 
 
    
    
 // MARK: - Variables
     var viewController: UIViewController?
    
// MARK: - Functions
    static func assembleModule(messageError:String) -> UIViewController {
        let view : AlertViewController = AlertViewController.loadFromNib()
        let router = AlertWireFrame()
        let interactor = AlertInteractor(data: messageError)
        let presenter = AlertPresenter(view: view, router: router, interactor: interactor)
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.output = presenter
         router.viewController = view
         return view
    }
    
    func dissmiss() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.viewController?.dismiss(animated: true)
          }
     }
 }

 
