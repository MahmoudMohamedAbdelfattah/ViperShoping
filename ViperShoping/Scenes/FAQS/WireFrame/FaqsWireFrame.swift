//
//  FaqsWireFrame.swift
//  ViperShoping
//
//  Created by Mahmoud on 23/07/2024.
//

import UIKit

class FaqsWireFrame : FaqsWireFrameProtocol {
 
    // MARK: - Variables
            var viewController: UIViewController?
    // MARK: - Functions
            static func assembleModule() -> UIViewController {
                let view : FaqsViewController = FaqsViewController()
                let wireframe = FaqsWireFrame()
                let interactor = FaqsInteractore()
                let presenter =  FaqsPresenter()
                view.presenter = presenter
                presenter.view = view
                presenter.interactor = interactor
                presenter.wireframe = wireframe
                interactor.outPut = presenter
                wireframe.viewController = view
                return view
            }
    
            func alerError(error: String) {
                  DispatchQueue.main.async {
                      UIApplication.shared.topViewController?.present(AlertWireFrame.assembleModule(messageError: error ), animated: true)
                  }
             }
    
            func presentToView(view:UIViewController) {
                    view.modalPresentationStyle = .overFullScreen
                    viewController?.present(view, animated: true)
            }
    
   }
