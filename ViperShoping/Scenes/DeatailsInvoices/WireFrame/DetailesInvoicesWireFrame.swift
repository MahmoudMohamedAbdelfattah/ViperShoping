//
//  DetailesInvoicesWireFrame.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 9/8/2024.
//

import Foundation


import UIKit


class DetailsInvoiceWireFrame : DetailsInvoiceWireFrameProtocol  {
 
    // MARK: - Variables
    var viewController: UIViewController?
    
    // MARK: - Functions
    static func assembleModule(detailsInvoiceProduct:[CartProductEntity]) -> UIViewController {
        
        let view : DetailesInvoicesViewController = DetailesInvoicesViewController.loadFromNib()
        let wireframe = DetailsInvoiceWireFrame()
        let interactor = DetailsInvoiceProductInteractor()
        let presenter = DetailsInvoiceProductPresenter()
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        interactor.outPut = presenter
        presenter.viewDidLoad(detailsInvoiceProduct: detailsInvoiceProduct)
        wireframe.viewController = view
        return view
    }
    
    func dismissView() {
        viewController?.dismiss(animated: true)
        }
    
    func pushToHome() {
         viewController?.dismiss(animated: true)
    }
    
}
