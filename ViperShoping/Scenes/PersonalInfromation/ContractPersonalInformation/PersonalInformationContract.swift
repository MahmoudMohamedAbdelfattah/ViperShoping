//
//  PersonalInformationContract.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 22/8/2024.
//


import UIKit

protocol PersonalInformationViewProtocol :AnyObject {
    
    // MARK: - Variables
       var presenter : PersonalInformationPresenterProtocol? {get}
    // MARK: - Functions
    func data(name:String,email:String,phone:String,image:String)
  }

  protocol PersonalInformationPresenterProtocol : AnyObject {
      // MARK: - Variables
        var view : PersonalInformationViewProtocol? {get set}
        var wireframe : PersonalInformationWireFrameProtocol? {get set}
        var interactor : PersonalInformationInteractorInputProtocol?{get set}
      // MARK: - Functions
        func PostdidLoadData()
      func updateProfile(name:String,email:String,phone:String,image:String)
    }

   protocol PersonalInformationInteractorInputProtocol : AnyObject {
       // MARK: - Variables
       var outPut: PersonalInformationInteractorOutputProtocol? { get set }
       // MARK: - Functions
       func didLoadData()
       func PostupdateProfile(name:String,email:String,phone:String,image:String)

   }

  protocol PersonalInformationInteractorOutputProtocol: AnyObject {
      // MARK: - Functions
       func didSignInSucess(data : InformationPersonal)
      func updateProfileSuccess()
      func onError(message: String)
  }

   protocol PersonalInformationWireFrameProtocol: AnyObject {
       // MARK: - Variables
       var viewController : UIViewController?{get set}
       // MARK: - Functions
       static func assembleModule() -> UIViewController
       func presentAlert(error:String)
       func dismiss()
   }
