//
//  ChooseLoginRouter.swift
//  ViperShoping
//
//  Created by Mahmoud on 22/06/2024.
//

import UIKit



class ChooseLoginWireFrame : ChooseLoginWireFrameProtocol {
  
 // MARK: - Variables
    weak var viewController: UIViewController?
    
 // MARK: - Functions
    static func assembleModule() -> UIViewController {
        let view : ChooseLoginViewController = ChooseLoginViewController.loadFromNib()
        view.modalPresentationStyle = .fullScreen
        let wireframe = ChooseLoginWireFrame()
        let presenter =  ChooseLoginPresenter()
        view.presenter = presenter
        wireframe.viewController = view
        return view
    }
    
    func presentToLogin(){
        self.viewController?.navigationController?.pushViewController(LoginWireFrame.assembleModule(), animated: true)
     }
    
    func presentToRegister(){
        self.viewController?.navigationController?.pushViewController(SignUpWireFrame.assembleModule(), animated: true)
    }
 }
