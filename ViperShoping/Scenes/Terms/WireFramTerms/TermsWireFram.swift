//
//  TermsWireFram.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 27/8/2024.
//

import Foundation


import UIKit

class TermsWireFram :  TermsWireFrameProtocol {
    
    // MARK: - Properties
    var viewController: UIViewController?
    
    // MARK: - Methods
    static func assembleModule() -> UIViewController {
        let view : TermsViewController = TermsViewController.loadFromNib()
        let wireframe = TermsWireFram()
        let interactor = TermsViewInteractor()
        let presenter =  TermsViewPresenter()
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
