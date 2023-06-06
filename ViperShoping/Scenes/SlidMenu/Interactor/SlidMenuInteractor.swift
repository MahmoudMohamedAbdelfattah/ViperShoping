//
//  SlidMenuInteractor.swift
//  ViperShoping
//
//  Created by Mahmoud on 10/09/2023.
//

import Foundation


class SlidMenuInteractor : SlidMenuInteractorInputProtocol {
  
// MARK: - Properties
        var outPut: SlidMenuInteractorOutputProtocol?
        var remoteDataManager: SlidMenuViewRemoteDataManagerInputProtocol?

// MARK: - Methods
    func postPresonalInfo(token: String) {
        remoteDataManager?.postInfoRequest(token: token)
    }
 }
 
extension  SlidMenuInteractor : SlidMenuViewRemoteDataManagerOutputProtocol {
 
 // MARK: - Methods
        func messageError(message: String) {
                outPut?.onError(message: message)
        }
    
        func signInSucess(data: InformationPersonal) {
            outPut?.didSignInSucess(data: data)
        }
 }
