//
//  ChooseLoginPresenter.swift
//  ViperShoping
//
//  Created by Mahmoud on 21/06/2023.
//

import UIKit


class ChooseLoginPresenter : ChooseLoginPresenterProtocol {
 
 // MARK: - Variables
    weak var view: ChooseLoginViewProtocol?
    var wireframe: ChooseLoginWireFrameProtocol?
    
 // MARK: - Functions
    func  routeTologinScreen() {
        wireframe?.presentToLogin()
    }
    
    func routeToRegisterScreen(){
        wireframe?.presentToRegister()
    }
}
