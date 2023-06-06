//
//  ContractIndicator.swift
//  ViperShoping
//
//  Created by Mahmoud on 08/07/2023.
//

import UIKit


    protocol IndicatorViewProtocol : AnyObject{
 // MARK: - Variables
    var presenter : IndicatorPresenterProtocol? { get set }
 // MARK: - Functions
    func showLoadingIndicator()
    func hideLoadingIndicator()
}

    protocol IndicatorPresenterProtocol :AnyObject{
 // MARK: - Variables
    var view:IndicatorViewProtocol?{get set}
    var router :IndicatorWireFrameProtocol?{get set}
 // MARK: - Functions
      func viewDidLoad()
  }

    protocol IndicatorWireFrameProtocol {
// MARK: - Variables
        var viewController : UIViewController?{get set}
// MARK: - Functions
        static func assembleModule() -> UIViewController
}
