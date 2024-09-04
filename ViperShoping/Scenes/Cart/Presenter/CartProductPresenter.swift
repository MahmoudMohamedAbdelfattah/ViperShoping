//
//  CartProductPresenter.swift
//  ViperShoping
//
//  Created by Mahmoud on 02/10/2024.
//
 
import UIKit
import CoreData
 class CartProductPresenter : CartPresenterProtocol{
  
    // MARK: - IBOutlets
    weak var view: CartProductViewProtocol?
    var wireframe: CartWireFrameProtocol?
    var interactor: CartInteractorInputProtocol?
    var CartProduct: [Invoice]? = []
 
    // MARK: - Methods
     func viewDidLoad() {
          interactor?.getData()
       }
    func routeToDismiss() {
        wireframe?.dismissView()
     }
    func routeToView(view:UIViewController){
        wireframe?.presentToView(view: view)
    }
 }
 
extension  CartProductPresenter : CartInteractorOutputProtocol {
 
  // MARK: - Methods
    func usersFetchedSuccessfully(data: [Invoice]?) {
         if var a = data {
             for i in a {
                self.CartProduct?.append(i)
            }
        }
           self.view?.reloadView()
     }
}

