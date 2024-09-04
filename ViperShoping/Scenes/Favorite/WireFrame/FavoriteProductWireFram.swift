//
//  FavoriteProductWireFram.swift
//  ViperShoping
//
//  Created by Mahmoud on 18/09/2024.
//

import UIKit

class FavoriteProductWireFrame : FavoriteWireFrameProtocol  {
 
    // MARK: - Variables
    var viewController: UIViewController?
    // MARK: - Functions
    static func assembleModule() -> UIViewController {
        
        let view : FavoriteProductViewController = FavoriteProductViewController()
        let wireframe = FavoriteProductWireFrame()
        let interactor = FavoriteProductInteractor()
        let presenter =  FavoriteProductPresenter()
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
}
