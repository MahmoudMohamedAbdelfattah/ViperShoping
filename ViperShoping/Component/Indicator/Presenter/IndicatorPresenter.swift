//
//  IndicatorPresenter.swift
//  ViperShoping
//
//  Created by Mahmoud on 08/07/2023.
//

import UIKit


class IndicatorPresenter : IndicatorPresenterProtocol {

// MARK: - Variables
    weak  var view: IndicatorViewProtocol?
    var router: IndicatorWireFrameProtocol?
 
// MARK: - Functions
      func viewDidLoad() {
        self.view?.showLoadingIndicator()
    }
    
}
