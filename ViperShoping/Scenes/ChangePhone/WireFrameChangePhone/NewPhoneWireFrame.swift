//
//  NewPhoneWireFrame.swift
//  ViperShoping
//
//  Created by Mahmoud on 25/09/2023.
//

 import UIKit


class ChangePhoneWireFrame : ChangePhoneWireFrameProtocol  {
 
// MARK: - Variables
    var viewController: UIViewController?
    
// MARK: - Functions
    static func assembleModule() -> UIViewController {
        let view : NewPhoneViewController = NewPhoneViewController.loadFromNib()
        let wireframe = ChangePhoneWireFrame()
        let interactor = ChangePhoneInterectore()
        let presenter =  ChangePhonePresenter(view: view, wireframe: wireframe, interactor: interactor)
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
}
