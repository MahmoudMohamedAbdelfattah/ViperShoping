//
//  RegisterViewControllerExtention.swift
//  ViperShoping
//
//  Created by Mahmoud on 29/07/2023.
//

import UIKit

extension RegisterViewController : SignUpViewProtocol {
 
    func hideLoadingAndShowErrorMessage(error:String) {
        presenter?.routeHideIndicatorAndShowAlert(eroorMessage: error)
    }
  }
