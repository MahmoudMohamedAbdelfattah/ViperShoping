//
//  LockPresenter.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 28/7/2024.
//

import Foundation

class LockViewPresenter  : LockPresenterProtocol {

// MARK: - Variables
    weak var view: LockViewProtocol?
    var wireframe: LockWireFrameProtocol?
    var interactor: LockInteractorInputProtocol?
    
// MARK: - Functions
        func viewDidLoad() {
        interactor?.getData()
    }
    func routViewController() {
        wireframe?.popViewController()
    }
}
extension  LockViewPresenter : LockInteractorOutputProtocol {
    func popView() {
        self.routViewController()
    }
}
