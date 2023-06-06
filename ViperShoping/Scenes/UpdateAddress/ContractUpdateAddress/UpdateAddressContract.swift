//
//  UpdateAddressContract.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 24/8/2024.
//

import Foundation


import UIKit

protocol UpdateAddressViewProtocol :AnyObject {
    
    // MARK: - Variables
       var presenter : UpdateAddressPresenterProtocol? {get}
    // MARK: - Functions
        func data(name:String,city:String,region:String,details:String)
  }

  protocol UpdateAddressPresenterProtocol : AnyObject {
      // MARK: - Variables
        var view : UpdateAddressViewProtocol? {get set}
        var wireframe : UpdateAddressWireFrameProtocol? {get set}
        var interactor : UpdateAddressInteractorInputProtocol?{get set}
      // MARK: - Functions
        func PostdidLoadData()
        func dismissView()
      
    }

   protocol UpdateAddressInteractorInputProtocol : AnyObject {
       // MARK: - Variables
       var outPut: UpdateAddressInteractorOutputProtocol? { get set }
       // MARK: - Functions
       func didLoadData()
       
 
   }

  protocol UpdateAddressInteractorOutputProtocol: AnyObject {
      // MARK: - Functions
       func didSignInSucess(data : getAddress)
    
  }

   protocol UpdateAddressWireFrameProtocol: AnyObject {
       // MARK: - Variables
       var viewController : UIViewController?{get set}
       // MARK: - Functions
       static func assembleModule() -> UIViewController
        func dismiss()
   }
