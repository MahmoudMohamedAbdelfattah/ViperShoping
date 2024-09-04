//
//  HomeRouter.swift
//  ViperShoping
//
//  Created by Mahmoud on 08/07/2024.
//

import UIKit
 
class HomeWireFrame : HomeWireFrameProtocol  {
 
// MARK: - Variables
    var viewController: UIViewController?
    
// MARK: - Functions
    static func assembleModule() -> UIViewController {
        let view : HomeViewController = HomeViewController.loadFromNib()
        let wireframe = HomeWireFrame()
        let interactor = HomeInteractor()
        let presenter =  HomePresenter()
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        interactor.outPut = presenter
        wireframe.viewController = view
        return view
    }
 
      func alerError(error: String) {
          DispatchQueue.main.async {
              UIApplication.shared.topViewController?.present(AlertWireFrame.assembleModule(messageError: error ), animated: true)
          }
     }
    
    func presentToView(view:UIViewController) {
        view.modalPresentationStyle = .overFullScreen
        viewController?.present(view, animated: true)
     }
    
}
