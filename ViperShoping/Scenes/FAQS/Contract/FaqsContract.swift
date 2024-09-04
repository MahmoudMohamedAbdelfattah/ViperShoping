//
//  FaqsContract.swift
//  ViperShoping
//
//  Created by Mahmoud on 23/07/2024.
//

import UIKit
 
    protocol FaqsViewProtocol :AnyObject {
         // MARK: - Variables
                var presenter : FaqsPresenterProtocol? {get}
         // MARK: - Functions
                func reloadData()
     }

    protocol FaqsPresenterProtocol : AnyObject{
         // MARK: - Variables
                var view : FaqsViewProtocol? {get set}
                var wireframe : FaqsWireFrameProtocol? {get set}
                var interactor : FaqsInteractorInputProtocol?{get set}
                var allQuestion :[ALLData]? {get set}
         // MARK: - Functions
                func viewDidLoad()
                func routeToView(view:UIViewController)
  }

    protocol  FaqsInteractorInputProtocol : AnyObject {
         // MARK: - Variables
                var outPut: FaqsInteractorOutputProtocol? { get set }
         // MARK: - Functions
                func getData()
}

    protocol  FaqsInteractorOutputProtocol: AnyObject {
         // MARK: - Functions
                func getDataSuccessfully(data: FaqsModule?)
                func getFetchingFailed(withError error: String)
}
 
    protocol FaqsWireFrameProtocol: AnyObject {
         // MARK: - Variables
                var viewController : UIViewController?{get set}
         // MARK: - Functions
               static func assembleModule() -> UIViewController
               func alerError(error:String)
               func presentToView(view:UIViewController)
           
 }

