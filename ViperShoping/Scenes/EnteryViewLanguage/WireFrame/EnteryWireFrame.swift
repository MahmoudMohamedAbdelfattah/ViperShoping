//
//  EnteryRouter.swift
//  ViperShoping
//
//  Created by Mahmoud on 21/06/2023.
//

import UIKit
import Foundation

class EnteryWireFrame : EntryLanguageWireFrameProtocol {

// MARK: - Variables
        var viewController: UIViewController?
    
// MARK: - Functions
    static func assembleModule() -> UIViewController {
        let view : EntryLanguageViewController = EntryLanguageViewController.loadFromNib()
        let wireframe = EnteryWireFrame()
        let presenter =  EntryLanguageViewPresenter()
        presenter.wireframe = wireframe
        view.presenter = presenter
        wireframe.viewController = view
        return view
    }
    
    func presentAuthArbic() {
        if LanguageHandler.currentLanguage().rawValue == "en"{
            LanguageHandler.setLanguage(NewLanguage.arabic)
           }
         self.viewController?.navigationController?.pushViewController(ChooseLoginWireFrame.assembleModule(), animated: true)
    }
    
    func presentAuthEnglish() {
        if LanguageHandler.currentLanguage().rawValue == "ar"{
            LanguageHandler.setLanguage(NewLanguage.english)
        }
        self.viewController?.navigationController?.pushViewController(ChooseLoginWireFrame.assembleModule(), animated: true)
    }
}
   
