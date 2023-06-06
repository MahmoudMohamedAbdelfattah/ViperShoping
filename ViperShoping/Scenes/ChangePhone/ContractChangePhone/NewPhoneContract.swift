//
//  NewPhoneContract.swift
//  ViperShoping
//
//  Created by Mahmoud on 25/09/2023.
//

import UIKit

protocol ChangePhoneViewProtocol :AnyObject {
    // MARK: - Variables
       var presenter : ChangePhonePresenterProtocol? {get}
    // MARK: - Functions
  }

  protocol ChangePhonePresenterProtocol : AnyObject {
      // MARK: - Variables
        var view : ChangePhoneViewProtocol? {get set}
        var wireframe : ChangePhoneWireFrameProtocol? {get set}
        var interactor : ChangePhoneInteractorInputProtocol?{get set}
      // MARK: - Functions
        func viewDidLoad()
  }

   protocol ChangePhoneInteractorInputProtocol : AnyObject {
       // MARK: - Variables
       var outPut: ChangePhoneInteractorOutputProtocol? { get set }
       // MARK: - Functions
       func getData()
}

  protocol ChangePhoneInteractorOutputProtocol: AnyObject {
      // MARK: - Functions
       func usersFetchedSuccessfully(data: HomeModel?)
       func usersFetchingFailed(withError error: String)
}

   protocol ChangePhoneWireFrameProtocol: AnyObject {
       // MARK: - Variables
       var viewController : UIViewController?{get set}
       // MARK: - Functions
       static func assembleModule() -> UIViewController
       func alerError(error:String)
}

