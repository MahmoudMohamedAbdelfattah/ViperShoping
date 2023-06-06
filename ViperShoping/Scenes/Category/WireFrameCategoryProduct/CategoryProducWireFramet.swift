//
//  RouterCategoryProduct.swift
//  ViperShoping
//
//  Created by Mahmoud on 17/07/2023.
//

import UIKit


class CategoryWireFrame : CategoryWireFrameProtocol {
 
    // MARK: - Variables
        var viewController: UIViewController?
    
    // MARK: - Functions
        static func assembleModule() -> UIViewController {
            let view : CategoryProduct = CategoryProduct.loadFromNib()
            let wireframe = CategoryWireFrame()
            let interactor = CategoryInteractor()
            let presenter =  CategoryPresenter()
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
    
    func presentToCategoryDetailsViewController(id:Int){
         viewController?.navigationController?.pushViewController(CategoryDeatailsWireFrame.assembleModule(id: id), animated: true)
    }
    
    func presentToView(view:UIViewController) {
        view.modalPresentationStyle = .overFullScreen
        viewController?.present(view, animated: true)
    }
    
 }
