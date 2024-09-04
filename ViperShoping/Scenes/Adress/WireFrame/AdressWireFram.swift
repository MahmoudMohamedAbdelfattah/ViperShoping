//
//  AdressWireFram.swift
//  ViperShoping
//
//  Created by Mahmoud on 23/07/2024.
//

import UIKit
import CoreLocation
class AdressWireFrame : AdressWireFrameProtocol {
 
// MARK: - Variables
    var viewController: UIViewController?

 // MARK: - Functions
    static func assembleModule() -> UIViewController {
        let view : AdressViewController = AdressViewController.loadFromNib()
        let wireframe  = AdressWireFrame()
        let interactor = AddressInteractor()
        let presenter =  AdressPresenter()
        let remoteDataManager = AdressRemoteDataManager()
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        interactor.outPut = presenter
        interactor.remoteDataManager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
        wireframe.viewController = view
        return view
    }
 
    func pushToHome() {
        DispatchQueue.main.async {
       self.viewController?.navigationController?.pushViewController(TabBarWireFrame.assembleModule(), animated: true)
         }
    }
    
    func presentAlert(error: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.viewController?.present(AlertWireFrame.assembleModule(messageError: error ), animated: true)
        }
    }
}

