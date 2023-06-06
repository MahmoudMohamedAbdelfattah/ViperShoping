//
//  ChangePasswordWireFrame.swift
//  ViperShoping
//
//  Created by Mahmoud on 25/09/2023.
//
 
import UIKit


class ChangePasswordWireFrame : ChangePasswordWireFrameProtocol  {
 
// MARK: - Variables
    var viewController: UIViewController?
    
// MARK: - Functions
    static func assembleModule() -> UIViewController {
        let view : ChangePasswordViewController = ChangePasswordViewController.loadFromNib()
        let wireframe = ChangePasswordWireFrame()
        let interactor = ChangePasswordInterectore()
        let presenter =  ChangePasswordPresenter()
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        
        interactor.outPut = presenter
        wireframe.viewController = view
        return view
    }
 
    func presentAlert(error:String) {
    
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.viewController?.present(AlertWireFrame.assembleModule(messageError: error ), animated: true)
        }
     }
    
    func dismiss() {
        DispatchQueue.main.async{
            self.viewController?.dismiss(animated: true, completion: nil)
        }
    }
}
