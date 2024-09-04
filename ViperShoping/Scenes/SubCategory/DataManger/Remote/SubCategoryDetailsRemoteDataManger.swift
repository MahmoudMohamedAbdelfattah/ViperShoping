//
//  SubCategoryDetailsRemoteDataManger.swift
//  ViperShoping
//
//  Created by Mahmoud on 23/09/2024.
//

import UIKit


class SubCategoryRemtoeDataManger : SubCategoryViewRemoteDataManagerInputProtocol {

     // MARK: - Properties
    var remoteRequestHandler: SubCategoryViewRemoteDataManagerOutputProtocol?
 
    // MARK: - Methods
    func postIDProduct(id: Int?) {
        NetworkManager.shared.fetchData(T: .subCategory(id: id ?? 0 , Content_Type: NetworkManager.shared.contentType, lang: LanguageHandler.currentLanguage().rawValue, Authorization: Component.shared.getApiToken() ?? ""), showIndectore: true , responseClass: SubCategory.self) { data, error in
 
             if data?.status == true {
                self.remoteRequestHandler?.onSucessfulLogin(loginModel: data ?? SubCategory())
                } else {
                     self.remoteRequestHandler?.messageError(message: data?.message ?? "")
                 }
           }
        }
    
    
    func postFavoriteCoreData(data: CategoryDataDetials) {
      //   CoreDataManager.sharedInstance.saveProductFavorite(products: data)
    //    CoreDataManager.sharedInstance.saveProductCoreData(products: data, entityName:   entityNameCoreData.favorite)
    }
 }
