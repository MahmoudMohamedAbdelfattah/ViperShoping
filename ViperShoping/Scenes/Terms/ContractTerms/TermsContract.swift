//
//  TermsContract.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 27/8/2024.
//

import Foundation


import UIKit

protocol TermsViewProtocol :AnyObject {
    
    // MARK: - Variables
       var presenter : TermsPresenterProtocol? {get}
    // MARK: - Functions
        func data(about:String,terms:String)
  }

  protocol TermsPresenterProtocol : AnyObject {
      // MARK: - Variables
        var view : TermsViewProtocol? {get set}
        var wireframe : TermsWireFrameProtocol? {get set}
        var interactor : TermsInteractorInputProtocol?{get set}
      // MARK: - Functions
        func PostdidLoadData()
        func dismissView()
    }

   protocol TermsInteractorInputProtocol : AnyObject {
       // MARK: - Variables
       var outPut: TermsInteractorOutputProtocol? { get set }
       // MARK: - Functions
       func didLoadData()
   }

  protocol TermsInteractorOutputProtocol: AnyObject {
      // MARK: - Functions
       func didSignInSucess(data : Terms)
  }

   protocol TermsWireFrameProtocol: AnyObject {
       // MARK: - Variables
       var viewController : UIViewController?{get set}
       // MARK: - Functions
       static func assembleModule() -> UIViewController
       func dismiss()
   }
