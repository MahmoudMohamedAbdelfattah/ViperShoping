//
//  SignUpViewLocalDataManager.swift
//  ViperShoping
//
//  Created by Mahmoud on 29/07/2023.
//

import CoreData

class SignUpViewLocalDataManager: SignUpLocalDataManagerInputProtocol{
    
// MARK: - Methode
    func saveApiToken(token: String) {
        let def = UserDefaults.standard
        def.setValue(token, forKey: "api_token")
        def.synchronize()
    }
}
