//
//  UpdateAddressWireFram.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 24/8/2024.
//

import UIKit

class UpdateAddressWireFram :  UpdateAddressWireFrameProtocol {
  
    // MARK: - Properties
    var viewController: UIViewController?
  
    // MARK: - Methods

    static func assembleModule() -> UIViewController {
        let view : UpdateAddressViewController = UpdateAddressViewController.loadFromNib()
        let wireframe = UpdateAddressWireFram()
        let interactor = UpdateAddressViewInteractor()
        let presenter =  UpdateAddressViewPresenter()
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        interactor.outPut = presenter
        wireframe.viewController = view
        return view
    }
   
    func dismiss() {
        DispatchQueue.main.async {
            self.viewController?.dismiss(animated: true)
        }
    }
 
}
