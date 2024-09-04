//
//  ChooseAuthContracte.swift
//  ViperShoping
//
//  Created by Mahmoud on 21/06/2024.
//

import UIKit
 
 protocol ChooseLoginViewProtocol :AnyObject {
 // MARK: - Variables
            var presenter : ChooseLoginPresenterProtocol? {get}
        }

 protocol ChooseLoginPresenterProtocol : AnyObject{
// MARK: - Variables
            var view : ChooseLoginViewProtocol? {get set}
            var wireframe : ChooseLoginWireFrameProtocol? {get set}
 // MARK: - Functions
            func routeTologinScreen()
            func routeToRegisterScreen()
        }

protocol ChooseLoginWireFrameProtocol: AnyObject {
// MARK: - Variables
            var viewController : UIViewController?{get set}
// MARK: - Functions
            static func assembleModule() -> UIViewController
            func presentToLogin()
            func presentToRegister()
        }
