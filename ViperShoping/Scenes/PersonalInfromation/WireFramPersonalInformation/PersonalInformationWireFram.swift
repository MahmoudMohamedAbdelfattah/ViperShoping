//
//  PersonalInformationWireFram.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 22/8/2024.
//

import UIKit

class PersonalInformationWireFram :  PersonalInformationWireFrameProtocol {
    
    // MARK: - Properties
    var viewController: UIViewController?
    
    // MARK: - Properties
    static func assembleModule() -> UIViewController {
        let view : PersonalInformationViewController = PersonalInformationViewController.loadFromNib()
        let wireframe = PersonalInformationWireFram()
        let interactor = PersonalInformationViewInteractor()
        let presenter =  PersonalInformationViewPresenter()
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireframe = wireframe
         interactor.outPut = presenter
        wireframe.viewController = view
        return view
    }
    
    func presentAlert(error: String) {
        
    }
    
    func dismiss() {
        DispatchQueue.main.async {
            self.viewController?.dismiss(animated: true)
        }
    }
}
