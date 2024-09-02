//
//  LockWireFram.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 30/7/2024.
//


import UIKit
class LockWireFrame : LockWireFrameProtocol  {
 
// MARK: - Variables
    var viewController: UIViewController?
    
// MARK: - Functions
    static func assembleModule() -> UIViewController {
        let view : LockedViewController = LockedViewController.loadFromNib()
        view.modalPresentationStyle = .fullScreen
        let wireframe = LockWireFrame()
        let interactor = LockInteractor()
        let presenter =  LockViewPresenter()
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        interactor.outPut = presenter 
        wireframe.viewController = view
        return view
    }
    
    func popViewController() {
       self.viewController?.dismiss(animated: true)
    }
}
    
