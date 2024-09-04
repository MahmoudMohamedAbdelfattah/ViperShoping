//
//  SubCategoryWireFrame.swift
//  ViperShoping
//
//  Created by Mahmoud on 23/09/2024.
//


import UIKit
 
class SubCategoryWireFrame : SubCategoryWireFrameProtocol {
 
   // MARK: - Variables
   var viewController: UIViewController?
   
   // MARK: - Functions
   static func assembleModule(id:Int) -> UIViewController {
            let view : SubCategoryViewController = SubCategoryViewController.loadFromNib()
            let wireframe = SubCategoryWireFrame()
            let interactor = SubCategoryInteractor()
            let dataMangerRemote = SubCategoryRemtoeDataManger()
            let presenter = SubCategoryPresenter()
            view.presenter = presenter
            presenter.view = view
            presenter.interactor = interactor
            presenter.wireframe = wireframe
            interactor.outPut = presenter
            dataMangerRemote.remoteRequestHandler = interactor
            interactor.remoteDataManager = dataMangerRemote
            presenter.routDataById(id: id)
            wireframe.viewController = view
           return view
   }
  
    func dismissView() {
       viewController?.dismiss(animated: true)
    }   
}
