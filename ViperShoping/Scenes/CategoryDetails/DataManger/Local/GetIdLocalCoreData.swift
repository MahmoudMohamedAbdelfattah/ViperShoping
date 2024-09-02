//
//  CoreData.swift
//  ViperShoping
//
//  Created by Mahmoud on 18/09/2023.
//

import UIKit
import CoreData

class CategoryDetailsLocaleDataManger : CategoryDetailsViewLocaleDataManagerInputProtocol {
  
    // MARK: - Properties
    internal var currentInvoiceIDKey: String? = "currentInvoiceID"
     var localRequestHandler: CategoryDetailsViewLocaleDataManagerOutputProtocol?
 
     internal var currentInvoiceID: String? {
        get {
            UserDefaults.standard.string(forKey: currentInvoiceIDKey ?? "")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: currentInvoiceIDKey ?? "")
        }
    }
    
    // MARK: - Methods

    func favoriteIdCoreData()  {
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else{return}
       
        let  Context = appdelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteProductEntity")
        do {
          let result = try Context.fetch(fetchRequest) as! [NSManagedObject]
            localRequestHandler?.favoriteId(id:result.map{$0.value(forKey: "id") as! Int})
         }
        catch {
         }
      }
 
    func SaveInvoiceCoreData(product: CategoryDataDetials, context: NSManagedObjectContext) {
        let invoice = PostgetOrCreateInvoice(context: context)
 
            let entity = NSEntityDescription.insertNewObject(forEntityName: "CartProductEntity", into: context) as! CartProductEntity
        do {
        entity.id = Int64(product.id ?? 0 ) // استخدام UUID كمعرف فريد
        entity.name = product.name
        entity.price = product.price ?? 0
        entity.quntity = Int64(product.quantity ?? 0 )
        entity.image = product.image
        entity.invoice = invoice
        try context.save()
        localRequestHandler?.updateInvoiceTotal(context: context)
            print("Invoice saved successfully")
        } catch {
            print("Failed to save invoice: \(error.localizedDescription)")
        }
    }
        
    func PostgetOrCreateInvoice(context: NSManagedObjectContext) -> Invoice {
        if let invoiceID = currentInvoiceID, let invoice = PostfetchInvoice(byID: invoiceID, context: context) {
            return invoice
        } else {
            let newInvoice = NSEntityDescription.insertNewObject(forEntityName: "Invoice", into: context) as! Invoice
            newInvoice.id = UUID().uuidString // استخدام UUID لتحديد الفاتورة بشكل فريد
            newInvoice.date = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .none)
            newInvoice.totalPrice = 0
            newInvoice.totalQuantity = 0
            currentInvoiceID = newInvoice.id
            return newInvoice
        }
    }
    
    func PostfetchInvoice(byID id: String, context: NSManagedObjectContext) -> Invoice? {
        
            let fetchRequest: NSFetchRequest<Invoice> = Invoice.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id == %@", id)
            
            do {
                let results = try context.fetch(fetchRequest)
                return results.first
            } catch {
                print("Failed to fetch invoice: \(error.localizedDescription)")
                return nil
            }
        }
    
    func deletIdProductFromInvoiceCoreData(productID: Int64, context: NSManagedObjectContext) {
        context.performAndWait {
            let invoice = PostgetOrCreateInvoice(context: context)
            let fetchRequest: NSFetchRequest<CartProductEntity> = CartProductEntity.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id == %d AND invoice == %@", productID, invoice)
            
            do {
                let results = try context.fetch(fetchRequest)
                
                _ = results.map{
                    if  $0.value(forKey: "id") as! Int == productID {
                        context.delete($0)
                   }
               }
                try context.save()
                localRequestHandler?.updateInvoiceTotal(context: context)
 
            } catch {
                NSLog("Failed to update product quantity: \(error.localizedDescription)")
            }
        }
    }
    
    func updateProductQuantityFromInvoice(productID: Int64, newQuantity: Int, context: NSManagedObjectContext) {
        
        context.performAndWait {
            let invoice = PostgetOrCreateInvoice(context: context)
            let fetchRequest: NSFetchRequest<CartProductEntity> = CartProductEntity.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id == %d AND invoice == %@", productID, invoice)
            
            do {
                let results = try context.fetch(fetchRequest)
                
                _ = results.map{
                    if $0.value(forKey: "id") as? Int64 == productID {
                        $0.setValue(newQuantity, forKey: "quntity")
                    }
                }
                try context.save()
                localRequestHandler?.updateInvoiceTotal(context: context)
 
            } catch {
                NSLog("Failed to update product quantity: \(error.localizedDescription)")
            }
        }
    }
    
    func clearCurrentInvoice() {
        currentInvoiceID = nil
    }
    
}
 
