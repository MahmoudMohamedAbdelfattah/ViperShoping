//
//  SlidMenuWireFrame.swift
//  ViperShoping
//
//  Created by Mahmoud on 10/09/2024.
//

import UIKit

class SlidMenuWireFrame : SlidMenuWireFrameProtocol {
 
    
     
// MARK: - Variables
    var viewController: UIViewController?
 
// MARK: - Functions
    static func assembleModule(token: String) -> UIViewController {
        
                let view : SlidMenuViewController = SlidMenuViewController.loadFromNib()
                let wireframe = SlidMenuWireFrame()
                let interactor = SlidMenuInteractor()
                let presenter =  SlidMenuPresenter()
                let remoterDataManager = SlidMenuRemoteDataManager()
                view.presenter = presenter
                presenter.view = view
                presenter.wireframe = wireframe
                presenter.interactor = interactor
                interactor.outPut = presenter
                interactor.remoteDataManager = remoterDataManager
                remoterDataManager.remoteRequestHandler = interactor
                wireframe.viewController = view
                return view
     }
    
    func presentAlert(error:String) {
        DispatchQueue.main.async {
            UIApplication.shared.topViewController?.present(AlertWireFrame.assembleModule(messageError: error ), animated: true)
        }
     }
 
    func HideIndicatorAndShowAlertError(messageErore: String) {
        DispatchQueue.main.async {
            UIApplication.shared.topViewController?.dismiss(animated: true, completion: {
                self.presentAlert(error: messageErore)
            })
        }
    }
    func presentToView(view:UIViewController) {
        view.modalPresentationStyle = .fullScreen
        viewController?.present(view, animated: true)
    }
    
    func dismiss() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
