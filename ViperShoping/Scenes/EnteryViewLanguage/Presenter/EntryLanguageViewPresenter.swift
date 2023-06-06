//
//  EnteryPresenter.swift
//  ViperShoping
//
//  Created by Mahmoud on 20/06/2023.

import UIKit

class EntryLanguageViewPresenter  : EntryLanguagePresenterProtocol {

// MARK: - Variables
    weak var view: EntryLanguageViewProtocol?
    var wireframe: EntryLanguageWireFrameProtocol?
    
// MARK: - Functions
    func routeToAuthViewArbic() {
        wireframe?.presentAuthArbic()
    }
    
    func routeToAuthViewEnglish() {
        wireframe?.presentAuthEnglish()
    }
}
