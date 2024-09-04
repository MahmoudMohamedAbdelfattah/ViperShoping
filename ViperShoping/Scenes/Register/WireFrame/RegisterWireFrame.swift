//
//  RegisterRouter.swift
//  ViperShoping
//
//  Created by Mahmoud on 22/06/2024.
//

import UIKit

class SignUpWireFrame : SignUpWireFrameProtocol {
 
    
     
// MARK: - Properties
       weak var viewController: UIViewController?
 
 // MARK: - Methods
      static func assembleModule() -> UIViewController {
        let view : RegisterViewController = RegisterViewController.loadFromNib()
        view.modalPresentationStyle = .fullScreen
        let interactor = SignUpViewInteractor()
        let wirefram = SignUpWireFrame()
        let presenter = SignUpViewPresenter()
        let remoteDataManager = SignUpViewRemoteDataManager()
        let localDataManager = SignUpViewLocalDataManager()
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireframe = wirefram
        interactor.outPut = presenter
        interactor.remoteDataManager = remoteDataManager
        interactor.localDataManager = localDataManager
        remoteDataManager.remoteRequestHandler = interactor
        wirefram.viewController = view
         return view
    }
 
    func presentAlert(error:String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.viewController?.present(AlertWireFrame.assembleModule(messageError: error ), animated: true)
        }
     }
    
     func pushToAddress(){
         DispatchQueue.main.async {
              self.viewController?.navigationController?.pushViewController(AdressWireFrame.assembleModule(), animated: true)
         }
     }
}
