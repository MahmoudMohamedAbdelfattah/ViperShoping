//
//  «عزCategoryPresenter.swift
//  ViperShoping
//
//  Created by Mahmoud on 23/09/2024.
//

import Foundation
import UIKit
 
class SubCategoryPresenter : SubCategoryPresenterProtocol{
  
 // MARK: - Variables
       weak var view: SubCategoryViewProtocol?
       var wireframe: SubCategoryWireFrameProtocol?
       var interactor: SubCategoryInteractorInputProtocol?
       var allProductCategoryDetails: InfoSubCategory?
 
    // MARK: - Methods
        func routDataById(id:Int) {
            self.interactor?.getData(id:id)
        }
 
        func routeToDismiss() {
            wireframe?.dismissView()
        }
 }

extension  SubCategoryPresenter : SubCategoryInteractorOutputProtocol {
 
// MARK: - Methods
    func didLoginCompleted(data: SubCategory?) {
        DispatchQueue.main.async {[weak self] in 
            guard let self = self else {return}
            self.allProductCategoryDetails = data?.data
            self.view?.getData(data: self.allProductCategoryDetails ?? InfoSubCategory())
            self.view?.reloadView()
        }
    }
 
       func usersFetchingFailed(withError message: String) {
           print(message)
        }
}
