//
//  CategoryDeatailsWireFrame.swift
//  ViperShoping
//
//  Created by Mahmoud on 20/07/2024.
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
 
      viewController?.navigationController?.pushViewController(TabBarWireFrame.assembleModule(), animated: true)
    }
}
