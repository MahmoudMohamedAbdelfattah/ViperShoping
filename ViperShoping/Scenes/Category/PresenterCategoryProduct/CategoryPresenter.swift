//
//  CategoryPresenter.swift
//  ViperShoping
//
//  Created by Mahmoud on 17/07/2023.
//

import UIKit
 
class CategoryPresenter : CategorytPresenterProtocol{
 
    // MARK: - Variables
        weak var view: CategoryViewProtocol?
        var wireframe: CategoryWireFrameProtocol?
        var interactor: CategoryInteractorInputProtocol?
        var allProductCategory: [DataInfo]?
     // MARK: - Methods
         func viewDidLoad() {
             interactor?.getData()
            }
        
        func presentViewCategoryDetails(id:Int) {
            wireframe?.presentToCategoryDetailsViewController(id: id)
            
           }
    
        func routeToView(view: UIViewController) {
            wireframe?.presentToView(view: view)
            }
     }
 
extension  CategoryPresenter : CategoryInteractorOutputProtocol {
    
    // MARK: - Methods
        func getDataSuccessfully(data: CategoryModel?) {
                self.allProductCategory = data?.data?.data
                self.view?.reloadData()
          }
        
        func getFetchingFailed(withError error: String) {
                wireframe?.alerError(error: error)
         }
}
