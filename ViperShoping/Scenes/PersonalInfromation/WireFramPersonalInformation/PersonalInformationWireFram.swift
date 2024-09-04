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
    
    // MARK: - Function
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
           self.viewController?.present(AlertWireFrame.assembleModule(messageError: error ), animated: true)
       }
    }
    
    func dismiss() {
        DispatchQueue.main.async {
            self.viewController?.dismiss(animated: true)
        }
    }
}
