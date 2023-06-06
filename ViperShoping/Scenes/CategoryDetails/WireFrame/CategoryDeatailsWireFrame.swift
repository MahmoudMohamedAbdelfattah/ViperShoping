//
//  CategoryDeatailsWireFrame.swift
//  ViperShoping
//
//  Created by Mahmoud on 20/07/2023.
//
 
import UIKit


class CategoryDeatailsWireFrame : CategoryDetailsWireFrameProtocol  {
 
    // MARK: - Variables
    var viewController: UIViewController?
    
    // MARK: - Functions
    static func assembleModule(id:Int) -> UIViewController {
        let view : CategoryDetailsViewController = CategoryDetailsViewController.loadFromNib()
        let wireframe = CategoryDeatailsWireFrame()
        let interactor = CategoryDeatailsInteractor()
        //   let presenter =  CategoryDetailsPresenter(view: view, wireframe: wireframe, interactor: interactor)
        let dataMangerRemote = CategoryDetailsRemtoeDataManger()
        let dataMangerLocal = CategoryDetailsLocaleDataManger()
        let presenter = CategoryDetailsPresenter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        
        interactor.outPut = presenter
        interactor.remoteDataManager = dataMangerRemote
        interactor.localDataManger = dataMangerLocal
        
        dataMangerRemote.remoteRequestHandler = interactor
        dataMangerLocal.localRequestHandler = interactor
 
        presenter.routDataById(id: id)
        wireframe.viewController = view
        
        return view
    }

    func presentToCart() {
      //  viewController?.present(CartProductWireFrame.assembleModule(), animated: true)
        
      viewController?.navigationController?.pushViewController(TabBarWireFrame.assembleModule(), animated: true)
    }
    
    func alerError(error: String) {
//        DispatchQueue.main.async {
//            UIApplication.shared.topViewController?.present(AlertWireFrame.assembleModule(messageError: error ), animated: true)
//            
//        }
    }
        
    func HideIndicatorAndShowAlertError(messageErore: String) {
//        DispatchQueue.main.async {
//            UIApplication.shared.topViewController?.dismiss(animated: true, completion: {
//                self.alerError(error: messageErore)
//            })
//        }
    }
    
}
