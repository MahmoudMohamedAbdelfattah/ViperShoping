//
//  ContractCategoryProduct.swift
//  ViperShoping
//
//  Created by Mahmoud on 17/07/2024.
//

import UIKit
 
protocol CategoryViewProtocol :AnyObject {
        // MARK: - Variables
            var presenter : CategorytPresenterProtocol? {get}
        // MARK: - Functions
            func reloadData()
            func presentToCategoryDetail(id:Int)
 }

protocol CategorytPresenterProtocol : AnyObject{
         // MARK: - Variables
            var view : CategoryViewProtocol? {get set}
            var wireframe : CategoryWireFrameProtocol? {get set}
            var interactor : CategoryInteractorInputProtocol?{get set}
            var allProductCategory :[DataInfo]? {get set}
        // MARK: - Functions
            func viewDidLoad()
            func presentViewCategoryDetails(id:Int)
            func routeToView(view:UIViewController)
 }

    protocol CategoryInteractorInputProtocol : AnyObject {
        // MARK: - Variables
            var outPut: CategoryInteractorOutputProtocol? { get set }
        // MARK: - Functions
            func getData()
}

    protocol CategoryInteractorOutputProtocol: AnyObject {
        // MARK: - Functions
            func getDataSuccessfully(data: CategoryModel?)
            func getFetchingFailed(withError error: String)
}
 
    protocol CategoryWireFrameProtocol: AnyObject {
         // MARK: - Variables
            var viewController : UIViewController?{get set}
        // MARK: - Functions
            static func assembleModule() -> UIViewController
            func alerError(error:String)
            func presentToCategoryDetailsViewController(id:Int)
            func presentToView(view:UIViewController)
}
