//
//  ContractInternet.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 27/6/2024.
//

import Foundation

import UIKit


    protocol InternetViewProtocol : AnyObject{
 // MARK: - Properties
    var presenter : InternetPresenterProtocol? { get set }
  //  func
}

protocol InternetPresenterProtocol :AnyObject{
    // MARK: - Variables
    var view:InternetViewProtocol?{get set}
    var router :InternetWireFrameProtocol?{get set}
    var interactor : InternetInteractorInputProtocol?{get set}
    var message : String? { get set}
    // MARK: - Method
    func routeToDismiss()
}

     protocol InternetInteractorInputProtocol : AnyObject {
// MARK: - Variables
        var output: InternetInteractorOutputProtocol? { get set }
 // MARK: - Method
        func getData()
 
        
}
    protocol InternetInteractorOutputProtocol: AnyObject {
  // MARK: - Functions
         func erroreMessage(error: String?)
 }

    protocol InternetWireFrameProtocol {
// MARK: - Variables
    var viewController : UIViewController?{get set}

// MARK: - Functions
     static func assembleModule() -> UIViewController
     func dismiss()
}
