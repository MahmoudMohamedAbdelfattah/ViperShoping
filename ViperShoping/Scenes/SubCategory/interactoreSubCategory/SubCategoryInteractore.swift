//
//  SubCategoryInteractore.swift
//  ViperShoping
//
//  Created by Mahmoud on 23/09/2023.
//

import Foundation

class SubCategoryInteractor : SubCategoryInteractorInputProtocol {
 
// MARK: - Variables
        var outPut: SubCategoryInteractorOutputProtocol?
        var remoteDataManager: SubCategoryViewRemoteDataManagerInputProtocol?
 
  // MARK: - Functions
        func getData(id : Int) {
            remoteDataManager?.postIDProduct(id: id)
         }
    }
   
extension  SubCategoryInteractor : SubCategoryViewRemoteDataManagerOutputProtocol {
 
     func onSucessfulLogin(loginModel: SubCategory?) {
             outPut?.didLoginCompleted(data: loginModel)
        }
  
    func messageError(message: String) {
        outPut?.usersFetchingFailed(withError: message)
    }
    
 }
