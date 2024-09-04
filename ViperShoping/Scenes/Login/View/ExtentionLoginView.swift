//
//  ExtentionLoginView.swift
//  ViperShoping
//
//  Created by Mahmoud on 30/07/2024.
//

import UIKit


extension LoginViewController {

    // MARK: -  Methods
 
    func hideLoadingAndShowErrorMessage(error:String) {
        presenter?.routeHideIndicatorAndShowAlert(eroorMessage: error)
    }
 }

