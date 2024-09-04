//
//  CartProductWireFram.swift
//  ViperShoping
//
//  Created by Mahmoud on 02/10/2024.
//

import UIKit

 class CartProductWireFrame : CartWireFrameProtocol  {
 
    // MARK: - Variables
    var viewController: UIViewController?
    
    // MARK: - Methods
    static func assembleModule() -> UIViewController {
        
        let view : CartProductViewController = CartProductViewController.loadFromNib()
        let wireframe = CartProductWireFrame()
        let interactor = CartProductInteractor()
        let presenter = CartProductPresenter()
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        interactor.outPut = presenter
        wireframe.viewController = view
        return view
    }
    
    func dismissView() {
        viewController?.dismiss(animated: true)
     }
    
    func presentToView(view:UIViewController) {
        view.modalPresentationStyle = .overFullScreen
        viewController?.present(view, animated: true)
    }
    
}
