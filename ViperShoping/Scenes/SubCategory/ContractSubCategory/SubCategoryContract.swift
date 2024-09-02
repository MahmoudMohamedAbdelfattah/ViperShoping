//
//  SubCategoryContract.swift
//  ViperShoping
//
//  Created by Mahmoud on 23/09/2023.
//

import UIKit


protocol SubCategoryViewProtocol :AnyObject {
   // MARK: - Variables
         var presenter : SubCategoryPresenterProtocol? {get set}
   // MARK: - Functions
        func reloadView()
        func getData(data:InfoSubCategory)
 }

protocol  SubCategoryPresenterProtocol : AnyObject{
  // MARK: - Variables
          var view : SubCategoryViewProtocol? {get set}
          var wireframe : SubCategoryWireFrameProtocol? {get set}
          var interactor : SubCategoryInteractorInputProtocol?{get set}
          var allProductCategoryDetails : InfoSubCategory? {get set}
         
  // MARK: - Functions
          func routDataById(id:Int)
          func routeToDismiss()
}

protocol  SubCategoryInteractorInputProtocol : AnyObject {
   // MARK: - Variables
           var outPut: SubCategoryInteractorOutputProtocol? { get set }
           var remoteDataManager: SubCategoryViewRemoteDataManagerInputProtocol?{ get set }
 
    // MARK: - Functions
           func getData(id : Int)
 
}

protocol  SubCategoryViewRemoteDataManagerInputProtocol: AnyObject{
    // MARK: - Variables
           var remoteRequestHandler:  SubCategoryViewRemoteDataManagerOutputProtocol? { get set }
   // MARK: - Functions
           func postIDProduct(id : Int?)
 }

protocol  SubCategoryViewRemoteDataManagerOutputProtocol: AnyObject{
    // MARK: - Functions
           func onSucessfulLogin(loginModel: SubCategory?)
           func messageError(message: String)
  }
 
protocol  SubCategoryInteractorOutputProtocol: AnyObject {
   // MARK: - Functions
           func didLoginCompleted(data : SubCategory?)
           func usersFetchingFailed(withError error: String)
    }

protocol  SubCategoryWireFrameProtocol: AnyObject {
   // MARK: - Variables
           var viewController : UIViewController?{get set}
   // MARK: - Functions
           static func assembleModule(id:Int) -> UIViewController
             func dismissView()
    }

 

