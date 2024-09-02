//
//  CategoryDetialsPresenter.swift
//  ViperShoping
//
//  Created by Mahmoud on 20/07/2023.
//

import CoreData
import UIKit


class CategoryDetailsPresenter : CategoryDeatailsPresenterProtocol{
  
// MARK: - Variables
        weak var view: CategoryDetailsViewProtocol?
        var wireframe: CategoryDetailsWireFrameProtocol?
        var interactor: CategoryDetailsInteractorInputProtocol?
        var allProductCategoryDetails: [CategoryDataDetials]?
        var chooseFavoriteID: [Int]?
        var purchasedProducts: [CategoryDataDetials]?
        var searchProduct: [CategoryDataDetials]?
 // MARK: - Methods
   
        func routDataById(id:Int) {
            self.interactor?.getData(id:id)
        }
    
        func searchProduct(text: String?) {
            self.interactor?.searchProduct(text: text ?? "")
        }
    
        func favoriteIdCoreData() {
            interactor?.getIdFavorite()
         }
 
        func saveProduct(data: CategoryDataDetials,kind:CoreDataManager.entityNameCoreData) {
            interactor?.postSaveProductCoreData(data: data, type: kind)
        }
 
        func deleteIdProduct(id: Int, entityName: CoreDataManager.entityNameCoreData) {
            interactor?.deleteIdProduct(id:id,entityName:entityName)
        }
    
        func routeToCartScreen() {
            wireframe?.presentToCart()
        }
    
        func saveInvoiceCoreData(product: CategoryDataDetials, context: NSManagedObjectContext) {
            interactor?.postSaveInvoiceCoreData(product: product, context: context)
            interactor?.getOrCreateInvoice(context: context)
        }
    
        func deletIdProductFromInvoice(productID: Int64, context: NSManagedObjectContext) {
            interactor?.PostdeletIdProductFromInvoice(productID: productID, context: context)
        }
    
        func PostupdateProductQuantityFromInvoice(productID: Int64, newQuantity: Int, context: NSManagedObjectContext) {
        
            interactor?.updateProductQuantityFromInvoice(productID: productID, newQuantity: newQuantity, context: context)
        }
    
        func postClearCurrentInvoice() {
            interactor?.clearCurrentInvoice()
        }
   }
 
extension  CategoryDetailsPresenter : CategoryDeatailsInteractorOutputProtocol {
  
    func getTotalQuntityAndPrice(totalQuntity: Int, totalPrice: Double) {
        view?.totalQuntityAndPrice(totalQuntity: totalQuntity, totalPrice: totalPrice)
    }
    
   
    // MARK: - Methods
        func searchCompleted(data: CategoriesDeatial?) {
             self.searchProduct = data?.data?.data
              self.view?.reloadView()
        }
    
        func getCartProduct(productCart: [CategoryDataDetials]) {
  
                    self.purchasedProducts = productCart
                    let totalQuntity = productCart.reduce(0) {$0 + ($1.quantity ?? 0)}
                    let totalPrice = productCart.map{Double(Int($0.price ?? 0) * ($0.quantity ?? 0))}.reduce(0,+)
                 
        }
 
        func didLoginCompleted(data : CategoriesDeatial?) {
                    self.allProductCategoryDetails = data?.data?.data
                    self.favoriteIdIsSelected()
                    self.shoppingCart()
                    self.view?.reloadView()
         }
       
        func favoriteIdIsSelected() {
             _ = self.chooseFavoriteID?.map{ favorite in
                if let products = self.allProductCategoryDetails {
                  _ =  products.enumerated().map{(index, product) in
                          if favorite == product.id{
                            self.allProductCategoryDetails?[index].isFavorite = true
                         }
                    }
                }
            }
         }
    
        func shoppingCart() {
                 _ = self.purchasedProducts?.map{ cartProduct in
                    if let products = self.allProductCategoryDetails {
                        _ =  products.enumerated().map{(index, product) in
                            if cartProduct.id == product.id {
                                self.allProductCategoryDetails?[index].isCart = true
                                self.allProductCategoryDetails?[index].quantity = cartProduct.quantity
                         }
                    }
                }
            }
        }
    
        func usersFetchingFailed(withError message: String) {
            
         }
    
        func getFavoriteId(favoriteId: [Int]?) {
            self.chooseFavoriteID = favoriteId
        }
}
 
