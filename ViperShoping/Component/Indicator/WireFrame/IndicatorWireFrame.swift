//
//  IndicatorRouter.swift
//  ViperShoping
//
//  Created by Mahmoud on 08/07/2023.
//

import UIKit

class IndicatorWireFrame : IndicatorWireFrameProtocol{
   
// MARK: - Variables
     var viewController: UIViewController?
    
// MARK: - Functions
    static func assembleModule() -> UIViewController {
        let view : IndicatorViewController = IndicatorViewController()
        let router = IndicatorWireFrame()
        let presenter = IndicatorPresenter(view: view, router: router)
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        router.viewController = view
         return view
    }
//    func dismiss() {
//        self.viewController?.dismiss(animated: true)
//    }
 }
