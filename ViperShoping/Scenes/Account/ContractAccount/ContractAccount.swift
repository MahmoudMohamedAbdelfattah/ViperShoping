//
//  ContractAccount.swift
//  ViperShoping
//
//  Created by Mahmoud on 25/09/2023.
//

import Foundation
import UIKit


protocol AccountViewProtocol :AnyObject {
// MARK: - Variables
       var presenter : AccountPresenterProtocol? {get}
 
 }
  protocol AccountPresenterProtocol : AnyObject {
 // MARK: - Variables
        var view : AccountViewProtocol? {get set}
        var wireframe : AccountWireFrameProtocol? {get set}
        var interactor : AccountInteractorInputProtocol?{get set}
// MARK: - Functions
        func viewDidLoad()
        func routeToView(view:UIViewController)
        func routeToDismiss()
  
 }
   protocol AccountInteractorInputProtocol : AnyObject {
// MARK: - Variables
       var outPut: AccountInteractorOutputProtocol? { get set }
// MARK: - Functions
       func getData()
}
  protocol AccountInteractorOutputProtocol: AnyObject {
// MARK: - Functions
       func usersFetchedSuccessfully(data: HomeModel?)
       func usersFetchingFailed(withError error: String)
}
   protocol AccountWireFrameProtocol: AnyObject {
// MARK: - Variables
       var viewController : UIViewController?{get set}
// MARK: - Functions
       static func assembleModule() -> UIViewController
       func presentToView(view:UIViewController) 
       func alerError(error:String)
       func dismissView()
}
