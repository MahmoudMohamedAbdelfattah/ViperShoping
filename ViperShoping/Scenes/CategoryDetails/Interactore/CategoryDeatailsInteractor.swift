//
//  CategoryInteractor.swift
//  ViperShoping
//
//  Created by Mahmoud on 21/07/2023.
//

import CoreData
import UIKit

class CategoryDeatailsInteractor : CategoryDetailsInteractorInputProtocol {
   

    

    // MARK: - Variables
        var outPut: CategoryDeatailsInteractorOutputProtocol?
        var remoteDataManager: CategoryDetailsViewRemoteDataManagerInputProtocol?
        var localDataManger : CategoryDetailsViewLocaleDataManagerInputProtocol?

  // MARK: - Functions
        func getData(id : Int) {
            remoteDataManager?.postIDProduct(id: id)
         }
    
        func searchProduct(text: String) {
            remoteDataManager?.postSearch(text: text)
        }
    
        func postSaveProductCoreData(data: CategoryDataDetials,type:CoreDataManager.entityNameCoreData){
            remoteDataManager?.postSaveProductCoreData(data: data, type: type)
        }
    
        func postCartData(data: CategoryDataDetials) {
          //  remoteDataManager?.postCartCoreData(data: data)
        }
    
        func getIdFavorite() {
            localDataManger?.favoriteIdCoreData()
        }
    
        func deleteIdProduct(id: Int, entityName: CoreDataManager.entityNameCoreData) {
            remoteDataManager?.deleteIdProduct(id:id,entityName:entityName)
         }
        func postSaveInvoiceCoreData(product: CategoryDataDetials, context: NSManagedObjectContext) {
            localDataManger?.SaveInvoiceCoreData(product: product, context: context)
        }
    
        func getOrCreateInvoice(context: NSManagedObjectContext) {
            localDataManger?.PostgetOrCreateInvoice(context: context)
        }
        func PostdeletIdProductFromInvoice(productID: Int64, context: NSManagedObjectContext) {
            localDataManger?.deletIdProductFromInvoiceCoreData(productID: productID, context: context)
        }
    
        func updateProductQuantityFromInvoice(productID: Int64, newQuantity: Int, context: NSManagedObjectContext) {
            localDataManger?.updateProductQuantityFromInvoice(productID: productID, newQuantity: newQuantity, context: context)
        }
        func clearCurrentInvoice() {
            localDataManger?.clearCurrentInvoice()
        }
    
     }
   
extension  CategoryDeatailsInteractor : CategoryDetailsViewRemoteDataManagerOutputProtocol , CategoryDetailsViewLocaleDataManagerOutputProtocol {
    

    func deleteCurrentInvoice(context: NSManagedObjectContext) {
        context.performAndWait {
            
             let invoice =  self.localDataManger?.PostgetOrCreateInvoice(context: context)
               context.delete(invoice ?? Invoice())

            do {
                 try context.save()
                 localDataManger?.clearCurrentInvoice()
                print("Current invoice deleted successfully.")
            } catch {
                NSLog("Failed to delete current invoice: \(error.localizedDescription)")
            }
        }
    }
    
    func updateInvoiceTotal(context: NSManagedObjectContext) {
        let invoice =  localDataManger?.PostgetOrCreateInvoice(context: context)
        var totalPrice = 0.0
        var totalQuantity = 0
        
         let fetchRequest: NSFetchRequest<CartProductEntity> = CartProductEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "invoice == %@", invoice ?? Invoice() )
        
        do {
            let results = try context.fetch(fetchRequest)
            for product in results {
                let quantity = product.quntity
                let price = product.price
                totalQuantity += Int(quantity)
                totalPrice += Double(quantity) * price

            }
            invoice?.totalPrice = totalPrice
            invoice?.totalQuantity = Int32(totalQuantity)
            try context.save()
            if invoice?.totalQuantity == 0 {
                self.deleteCurrentInvoice(context: context)
            }
            outPut?.getTotalQuntityAndPrice(totalQuntity: totalQuantity, totalPrice: totalPrice)
        } catch {
          }
    }
    
    
    
    func sucessfullSearch(loginModel: CategoriesDeatial?) {
        outPut?.searchCompleted(data: loginModel)
     
    }
    
  
     func SuccessfullyCartProduct(data: [CategoryDataDetials]) {
    
             outPut?.getCartProduct(productCart: data )
      }
    
    func getDataSuccessfully(loginModel: CategoriesDeatial?) {
        outPut?.didLoginCompleted(data: loginModel)
    }
  
    func getFetchingFailed(message: String) {
        outPut?.usersFetchingFailed(withError: message)
    }
    
    func favoriteId(id: [Int]?) {
       
        outPut?.getFavoriteId(favoriteId: id)
    }
}
