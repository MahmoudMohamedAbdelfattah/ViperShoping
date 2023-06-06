//
//  ContractLockScreen.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 28/7/2024.
//
 

import UIKit

 protocol LockViewProtocol :AnyObject {
 // MARK: - Variables
        var presenter : LockPresenterProtocol? {get}
 // MARK: - Functions
   }
   protocol LockPresenterProtocol : AnyObject {
  // MARK: - Variables
         var view : LockViewProtocol? {get set}
         var wireframe : LockWireFrameProtocol? {get set}
         var interactor : LockInteractorInputProtocol?{get set}
     
 // MARK: - Functions
         func viewDidLoad()
         func routViewController()

 
  }
    protocol LockInteractorInputProtocol : AnyObject {
// MARK: - Variables
        var outPut: LockInteractorOutputProtocol? { get set }
// MARK: - Functions
        func getData()
}
   protocol LockInteractorOutputProtocol: AnyObject {
 // MARK: - Functions
      func popView()
}
    protocol LockWireFrameProtocol: AnyObject {
 // MARK: - Variables
         var viewController : UIViewController?{get set}
// MARK: - Functions
        static func assembleModule() -> UIViewController
        func popViewController()
 
}
