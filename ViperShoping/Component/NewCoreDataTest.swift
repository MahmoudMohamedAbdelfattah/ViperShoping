//
//  NewCoreDataTest.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 13/8/2024.
//

import Foundation



import CoreData
import UIKit


class InvoiceManagerr {
    
    // اسم الفاتورة المفتوحة (يمكن استخدام معرف أو سمة مميزة لتتبع الفاتورة المفتوحة)
    private let currentInvoiceIDKey = "currentInvoiceID"
    
    private var currentInvoiceID: String? {
        get {
            UserDefaults.standard.string(forKey: currentInvoiceIDKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: currentInvoiceIDKey)
        }
    }
    
    func getOrCreateInvoice(context: NSManagedObjectContext) -> Invoice {
        if let invoiceID = currentInvoiceID, let invoice = fetchInvoice(byID: invoiceID, context: context) {
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
    
    func fetchInvoice(byID id: String, context: NSManagedObjectContext) -> Invoice? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Invoice")
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        
        do {
            let results = try context.fetch(fetchRequest)
            return results.first as? Invoice
        } catch {
            print("Failed to fetch invoice: \(error.localizedDescription)")
            return nil
        }
    }
    
    func fetchAllInvoices(context: NSManagedObjectContext) -> [Invoice]? {
        let fetchRequest: NSFetchRequest<Invoice> = Invoice.fetchRequest()
        
        do {
            let results = try context.fetch(fetchRequest)
            return results
        } catch {
            print("Failed to fetch invoices: \(error.localizedDescription)")
            return nil
        }
    }
    
    
    
    func saveProducts(products: CategoryDataDetials, context: NSManagedObjectContext) {
        let invoice = getOrCreateInvoice(context: context)
 
        let entity = NSEntityDescription.insertNewObject(forEntityName: "CartProductEntity", into: context) as! CartProductEntity
        do {
                    entity.setValue(products.name, forKey: "name")
                    entity.setValue(products.image, forKey: "image")
                    entity.setValue(products.price, forKey: "price")
                    entity.setValue(products.discount, forKey: "discount")
                    entity.setValue(products.id, forKey: "id")
                    entity.setValue(products.quantity, forKey: "quntity")
                    entity.invoice = invoice
                    getTotalInvoice(context: context)
                    try context.save()
        }
        catch {
       }
        
    }
 
    func getTotalInvoice(context: NSManagedObjectContext) {
        let invoice = getOrCreateInvoice(context: context)
        var totalPrice = 0.0
        var totalQuantity = 0
        // Fetch all products in the invoice
        
        let fetchRequest: NSFetchRequest<CartProductEntity> = CartProductEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "invoice == %@", invoice)
        
        do {
            let results = try context.fetch(fetchRequest)
            for product in results {
                // Calculate the total value for each product
                let quantity = product.quntity
                let price = product.price
              
                let productsPrice = Double(quantity) * price
                totalQuantity += Int(quantity)
                totalPrice += productsPrice
            }
            invoice.totalPrice = totalPrice
            invoice.totalQuantity = Int32(totalQuantity)
            
            
        } catch {
            print("Failed to fetch products: \(error.localizedDescription)")
         
        }
    }
    
    func clearCurrentInvoice() {
        currentInvoiceID = nil
    }
    
    
  func updateProductQuantity(productID: Int64, newQuantity: Int, context: NSManagedObjectContext) {
       context.performAndWait {
           let invoice = getOrCreateInvoice(context: context)
           
       let fetchRequest: NSFetchRequest<CartProductEntity> = CartProductEntity.fetchRequest()
           fetchRequest.predicate = NSPredicate(format: "id == %d AND invoice == %@", productID, invoice)
           
           do {
               let results = try context.fetch(fetchRequest)
               if let product = results.last {
                   
                   // Update product quantity and recalculate totals
                   let oldQuantity = product.quntity
                   product.quntity = Int64(newQuantity)
                    let pricePerUnit = product.price
                   let oldTotal = Double(oldQuantity) * pricePerUnit
                   let newTotal = Double(newQuantity) * pricePerUnit
                   let invoiceTotalChange = newTotal - oldTotal
                   
                   // Update invoice total price and quantity
                   invoice.totalPrice += invoiceTotalChange
                   invoice.totalQuantity += (Int32(newQuantity) - Int32(oldQuantity))
               
                   try context.save()
                   print("Product quantity updated successfully")
               } else {
                   print("Product not found")
               }
           } catch {
               NSLog("Failed to update product quantity: \(error.localizedDescription)")
           }
       }
   }
}
