//
//  ContractAlert.swift
//  ViperShoping
//
//  Created by Mahmoud on 09/07/2023.
//

import UIKit


    protocol AlertViewProtocol : AnyObject{
 // MARK: - Properties
    var presenter : AlertPresenterProtocol? { get set }
  //  func 
}

    protocol AlertPresenterProtocol :AnyObject{
 // MARK: - Variables
    var view:AlertViewProtocol?{get set}
    var router :AlertWireFrameProtocol?{get set}
    var interactor : AlertInteractorInputProtocol?{get set}
    var message : String? { get set}
// MARK: - Method
     func didLoad()
        func dismissView()
    }

     protocol AlertInteractorInputProtocol : AnyObject {
// MARK: - Variables
        var output: AlertInteractorOutputProtocol? { get set }
        var data: String { get }
// MARK: - Method
        func getData()
}
    protocol AlertInteractorOutputProtocol: AnyObject {
  // MARK: - Functions
         func erroreMessage(error: String?)
 }

    protocol AlertWireFrameProtocol {
// MARK: - Variables
    var viewController : UIViewController?{get set}

// MARK: - Functions
     static func assembleModule(messageError:String) -> UIViewController
        func dissmiss()
}
