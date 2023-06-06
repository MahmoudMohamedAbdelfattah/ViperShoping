//
//  AlertInteractor.swift
//  ViperShoping
//
//  Created by Mahmoud on 11/07/2023.
//

import Foundation


class AlertInteractor : AlertInteractorInputProtocol {
 
// MARK: - Properties
    var data: String
    var output: AlertInteractorOutputProtocol?

// MARK: - Initializers
    
    init(data: String) {
        self.data = data
    }
 
// MARK: - Method
    func getData() {
        output?.erroreMessage(error: data)
    }
 }
