//
//  CategoryDetailsRemtoeDataManger.swift
//  ViperShoping
//
//  Created by Mahmoud on 09/08/2024.
//

import Foundation

class CategoryDetailsRemtoeDataManger : CategoryDetailsViewRemoteDataManagerInputProtocol {
  
     // MARK: - Properties
    var remoteRequestHandler: CategoryDetailsViewRemoteDataManagerOutputProtocol?
 
    // MARK: - Methods
    func postIDProduct(id: Int) {
         NetworkManager.shared.fetchData(T: .categoryDetails(category_id: id , Content_Type: NetworkManager.shared.contentType, lang: LanguageHandler.currentLanguage().rawValue, Authorization: Component.shared.getApiToken() ?? ""), showIndectore: true, responseClass: CategoriesDeatial.self) { data, error in
                  if data?.status == true {
                      self.remoteRequestHandler?.getDataSuccessfully(loginModel: data ?? CategoriesDeatial())
                  } else {
                     self.remoteRequestHandler?.getFetchingFailed(message: data?.message ?? "")
                 }
            }
    }
    
    func postSearch(text: String) {
        NetworkManager.shared.fetchData(T: .search(text: text, Content_Type:  NetworkManager.shared.contentType, lang: LanguageHandler.currentLanguage().rawValue, Authorization: Component.shared.getApiToken() ?? ""), showIndectore: false, responseClass: CategoriesDeatial.self) { data, error in
            if data?.status == true {
                
                self.remoteRequestHandler?.sucessfullSearch(loginModel: data ?? CategoriesDeatial())
            } else {
                self.remoteRequestHandler?.getFetchingFailed(message: data?.message ?? "")
                
            }
        }
    }
    
    func postSaveProductCoreData(data: CategoryDataDetials , type: CoreDataManager.entityNameCoreData ) {
         CoreDataManager.sharedInstance.saveProductCoreData(products: data, entityName: type)
    }
    
    func deleteIdProduct(id: Int, entityName: CoreDataManager.entityNameCoreData) {
        CoreDataManager.sharedInstance.deleteId(id: id, entityName: entityName)
    }
  }
