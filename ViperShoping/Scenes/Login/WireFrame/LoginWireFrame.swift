//
//  LoginRouter.swift
//  ViperShoping
//
//  Created by Mahmoud on 22/06/2023.
//

import UIKit


class LoginWireFrame : LoginWireFrameProtocol {
 
    // MARK: - Variables
    var viewController: UIViewController?
    
    // MARK: - Functions
    static func assembleModule() -> UIViewController {
        let view : LoginViewController = LoginViewController.loadFromNib()
        view.modalPresentationStyle = .fullScreen
        let wireframe = LoginWireFrame()
        let interactor = LoginInteractor()
        let presenter =  LoginPresenter()
        let remoterDataManager = LoginViewRemoteDataManager()
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = wireframe
        presenter.interactor = interactor
        remoterDataManager.remoteRequestHandler = interactor
        interactor.outPut = presenter
        interactor.remoteDataManager = remoterDataManager
        wireframe.viewController = view
        return view
    }
    
    func presentAlert(error:String) {
         DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.viewController?.present(AlertWireFrame.assembleModule(messageError: error ), animated: true)
        }
     }
    
    func presentToHome(){
        DispatchQueue.main.async {
            RootManager.rootViewController(for: UIApplication.shared.mainWindow , with: nil, rootViewController: TabBarWireFrame.assembleModule())
        }
    }
    
    func dismiss() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
 
