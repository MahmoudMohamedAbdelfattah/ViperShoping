//
//  FavoriteProductPresenter.swift
//  ViperShoping
//
//  Created by Mahmoud on 18/09/2023.
//

import UIKit




class FavoriteProductPresenter : FavoritePresenterProtocol{

    // MARK: - Variables
    weak var view: FavoriteProductViewProtocol?
    var wireframe: FavoriteWireFrameProtocol?
    var interactor: FavoriteInteractorInputProtocol?
    var favoriteProduct: [CategoryDataDetials]? = []
    
    // MARK: - Methods
     func viewDidLoad() {
          interactor?.getData()
      }
    
    func routeToDismiss() {
        wireframe?.dismissView()
     }
 }
 
extension  FavoriteProductPresenter : FavoriteInteractorOutputProtocol {
  
  // MARK: - Methods
    func getDataSuccessfully(data: [CategoryDataDetials]?) {
        if let product = data {
          _ = product.map{self.favoriteProduct?.append($0)}
        }
     }
    
 
}
