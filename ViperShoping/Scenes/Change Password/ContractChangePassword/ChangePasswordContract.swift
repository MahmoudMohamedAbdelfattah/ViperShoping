//
//  ChangePasswordContract.swift
//  ViperShoping
//
//  Created by Mahmoud on 25/09/2023.
//

import UIKit

protocol ChangePasswordViewProtocol :AnyObject {
    
    // MARK: - Variables
       var presenter : ChangePasswordPresenterProtocol? {get}
    // MARK: - Functions
  }

  protocol ChangePasswordPresenterProtocol : AnyObject {
      // MARK: - Variables
        var view : ChangePasswordViewProtocol? {get set}
        var wireframe : ChangePasswordWireFrameProtocol? {get set}
        var interactor : ChangePasswordInteractorInputProtocol?{get set}
      // MARK: - Functions
        func postChangePassword(current_password: String ,new_password: String, Content_Type: String, lang: String, Authorization: String)
      func dismiss()
    }

   protocol ChangePasswordInteractorInputProtocol : AnyObject {
       // MARK: - Variables
       var outPut: ChangePasswordInteractorOutputProtocol? { get set }
       // MARK: - Functions
       func changePassword(current_password: String ,new_password: String, Content_Type: String, lang: String, Authorization: String)
   }

  protocol ChangePasswordInteractorOutputProtocol: AnyObject {
      // MARK: - Functions
       func usersFetchedSuccessfully(data: ChangePassword?)
       func usersFetchingFailed(withError error: String)
  }

   protocol ChangePasswordWireFrameProtocol: AnyObject {
       // MARK: - Variables
       var viewController : UIViewController?{get set}
       // MARK: - Functions
       static func assembleModule() -> UIViewController
       func presentAlert(error:String)
       func dismiss()
   }
