//
//  CoreDataManger.swift
//  ViperShoping
//
//  Created by Mahmoud on 22/08/2023.
//
 
import UIKit
import CoreData



class CoreDataManager {
    
    // MARK: - Variables
    static let sharedInstance = CoreDataManager()
    // New 1
    
    func saveOrUpdateInvoice(id: String, date: String, products: [CategoryDataDetials]) {
        print("Saving or Updating Invoice...")
        print("Invoice ID: \(id)")

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext

         let fetchRequest: NSFetchRequest<Invoice> = Invoice.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)

        let invoice: Invoice
        do {
            let fetchedInvoices = try context.fetch(fetchRequest)
            if let existingInvoice = fetchedInvoices.first {
                invoice = existingInvoice
            } else {
                 invoice = NSEntityDescription.insertNewObject(forEntityName: "Invoice", into: context) as! Invoice
                invoice.id = id
                invoice.date = date
                invoice.totalPrice = 0
                invoice.totalQuantity = 0
            }
        } catch {
            print("Failed to fetch or create invoice: \(error)")
            return
        }

        var totalPrice = invoice.totalPrice
        var totalQuantity = invoice.totalQuantity

         for productData in products {
            let product = NSEntityDescription.insertNewObject(forEntityName: "CartProductEntity", into: context) as! CartProductEntity
            product.id = Int64(Date().timeIntervalSince1970) // استخدام توقيت الوقت كمعرف
            product.name = productData.name
            product.price = productData.price ?? 0.0
            product.quntity = Int64(productData.quantity ?? 0)
            
             totalPrice += (productData.price ?? 0.0) * Double(productData.quantity ?? 0)
            totalQuantity += Int32(productData.quantity ?? 0)
            
             product.invoice = invoice
        }

        invoice.totalPrice = totalPrice
        invoice.totalQuantity = totalQuantity
        
        print("Invoice Details: \(invoice)")

         do {
            try context.save()
            print("Invoice saved or updated successfully")
 
        } catch {
            print("Failed to save or update invoice: \(error)")
        }
    }

 
////
    func saveInvoice(id: String, date: String, products: CategoryDataDetials) {
        print("invoiceIdinvoiceIdinvoiceIdinvoiceIdinvoiceIdinvoiceIdinvoiceId")
        print(id)
          guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
          let context = appDelegate.persistentContainer.viewContext
          
          // إنشاء فاتورة جديدة
          let invoice = NSEntityDescription.insertNewObject(forEntityName: "Invoice", into: context) as! Invoice
          invoice.id = id
          invoice.date = date
 
        print("invoiceIdinvoiceIdinvoiceIdinvoiceIdinvoiceIdinvoiceIdinvoiceId]")
          // إضافة المنتجات إلى الفاتورة
          var totalPrice = 0.0
          var totalQuantity = 0
        
        let product = NSEntityDescription.insertNewObject(forEntityName: "CartProductEntity", into: context) as! CartProductEntity
        
            product.setValue(products.name, forKey: "name")
            product.setValue(products.image, forKey: "image")
            product.setValue(products.price, forKey: "price")
            product.setValue(products.discount, forKey: "discount")
            product.setValue(products.id, forKey: "id")
            product.setValue(products.quantity, forKey: "quntity")
                
  
         //   }
    
            
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CartProductEntity")
        do {
            let result = try context.fetch(fetchRequest) as! [NSManagedObject]
    
            let totalQuantity = result.reduce(0) { $0 + ($1.value(forKey: "quntity") as? Int16 ?? 0) }
            let totalPrice = result.reduce(0) { $0 + ($1.value(forKey: "price") as? Double ?? 0)}
                invoice.totalPrice = totalPrice
                invoice.totalQuantity = Int32(totalQuantity)
                product.invoice = invoice
            invoice.products = NSSet(array: [product])
            print("totalQuantitytotalQuantitytotalQuantitytotalQuantitytotalQuantity")
        print(totalQuantity)
        print("totalPricetotalPricetotalPricetotalPricetotalPricetotalPrice")

        print(totalPrice)
         
        } catch{}
         
 
          do {
              try context.save()
              print("Invoice saved successfully")
 
          } catch {
              print("Failed to save invoice: \(error)")
          }
      }

    
    
    // New 2
    var products: [CategoryDataDetials] = []
  //  var invoices: [Invoices] = []
     var invoiceProducts: [String: [CategoryDataDetials]] = [:] // Dictionary to store products for each invoice ID
   //إضافة منتج إلى فاتورة
    
    func addProductToInvoice(product: CategoryDataDetials, invoiceId: String) {
        // Add product to the invoice
        if invoiceProducts[invoiceId] != nil {
            invoiceProducts[invoiceId]?.append(product)
        } else {
            invoiceProducts[invoiceId] = [product]
        }
        
        // Update the invoice's total price and quantity
        updateInvoiceTotals(invoiceId: invoiceId)
    }

    func updateInvoiceTotals(invoiceId: String) {
        guard let products = invoiceProducts[invoiceId] else { return }
        
        var totalPrice = 0.0
        var totalQuantity = 0
        
        for product in products {
            if let price = product.price, let quantity = product.quantity {
                totalPrice += price * Double(quantity)
                totalQuantity += quantity
            }
        }
 
    }

    
    
    /////
    
    enum entityNameCoreData : String {
     
         case cart , favorite
        var description: String {
            switch self {
            case .cart:
                return "CartProductEntity"
            case .favorite:
                return "FavoriteProductEntity"
            }
          }
        }
    
    
     // MARK: - Function
    
      func getTotalInvoice() {
         var totalQuntity = 0
        var totalPrice = 0.0
          guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else{return}
           let  Context = appdelegate.persistentContainer.viewContext
          let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CartProductEntity")
          do {
              let result = try Context.fetch(fetchRequest) as! [NSManagedObject]
            //  _ = result.map{
  //                  let productquntity = $0.value(forKey: "quntity")
  //                let productquntityy = $1.value(forKey: "quntity")
               //    cartProduct.quntity = productquntity as? Int
                    let sumQuntity = result.reduce(0) { $0 + ($1.value(forKey: "quntity") as? Int16 ?? 0) }
                    let sumPrice = result.reduce(0) { $0 + ($1.value(forKey: "price") as? Double ?? 0) }

               totalQuntity =  Int(sumQuntity)
                totalPrice = Double(sumPrice)
              print("totalPricetotalPricetotalPricetotalPricetotalPricetotalPrice")
              print(totalPrice)
              print("totalQuntitytotalQuntitytotalQuntitytotalQuntity")
              print(totalQuntity)
           }
        catch{
       }
     }
    
    func saveProductCoreData(products: CategoryDataDetials ,entityName:entityNameCoreData ) {
 
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else {return}
         let manageContext = appdelegate.persistentContainer.viewContext
       let entity = NSEntityDescription.insertNewObject(forEntityName: entityName.description, into: manageContext)
 
        do {
                    entity.setValue(products.name, forKey: "name")
                    entity.setValue(products.image, forKey: "image")
                    entity.setValue(products.price, forKey: "price")
                    entity.setValue(products.discount, forKey: "discount")
                    entity.setValue(products.id, forKey: "id")
                    entity.setValue(products.quantity, forKey: "quntity")
                    try manageContext.save()
        }
             catch {
          
        }
       
            do {
                try manageContext.save()
                print("Invoice saved successfully")
            } catch {
                print("Failed to save invoice: \(error)")
            }
        }
    
    
func updata (id : Int , quntity: Int) {
    guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else {return}
    let manageContext = appdelegate.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CartProductEntity")
    do {
        let result = try manageContext.fetch(fetchRequest) as! [NSManagedObject]
        _ = result.last.map{
            if $0.value(forKey: "id") as? Int == id {
                $0.setValue(quntity, forKey: "quntity")
            }
        }
        
        try manageContext.save()

    } catch {}
}
 
    func fetchProductDataID()->[Int] {
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else{return[]}
        var productId : [Int] =  []
        let  Context = appdelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteProductEntity")
        do {
          let result = try Context.fetch(fetchRequest) as! [NSManagedObject]
            for data in result {
                let idProduct = data.value(forKey: "id")
                productId.append(idProduct as! Int)
             }
        } catch {
            
        }
        return productId
    }
    
    func deleteData(index : Int) {
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let manageContext = appdelegate.persistentContainer.viewContext
        let fetchRequest  = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteProductEntity")
        fetchRequest.returnsObjectsAsFaults = false
       do {
           let result = try manageContext.fetch(fetchRequest) as! [NSManagedObject]
           let resultDelet = result[index]
           manageContext.delete(resultDelet)
           try manageContext.save()
       } catch {
           print("Errore")
       }
   }
    
    func deleteId(id : Int , entityName:entityNameCoreData) {
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else{return}
        
        let  Context = appdelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName.description)
        do {
            let result = try Context.fetch(fetchRequest) as! [NSManagedObject]
           _ = result.map {
                 if  $0.value(forKey: "id") as! Int == id {
                    Context.delete($0)
                }
            }
            try Context.save()

        } catch {
        }
    }
}

 
