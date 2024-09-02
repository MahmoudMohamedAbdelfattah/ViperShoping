//
//  إثصئخقثىشفش.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 6/8/2024.
//

import CoreData
import UIKit


class InvoiceManager {
    
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
    
    
    
    func saveProducts(product: CategoryDataDetials, context: NSManagedObjectContext) {
        let invoice = getOrCreateInvoice(context: context)
        
        var totalPrice = 0.0
        var totalQuantity = 0
        
       
            let entity = NSEntityDescription.insertNewObject(forEntityName: "CartProductEntity", into: context) as! CartProductEntity
        do {
        entity.id = Int64(product.id ?? 0 ) // استخدام UUID كمعرف فريد
        entity.name = product.name
        entity.price = product.price ?? 0
        entity.quntity = Int64(product.quantity ?? 0 )
            entity.image = product.image
        entity.invoice = invoice
    
            try context.save()
            updateInvoiceTotal(context: context)
            print("Invoice saved successfully")
        } catch {
            print("Failed to save invoice: \(error.localizedDescription)")
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
                
                _ = results.map{
                    if $0.value(forKey: "id") as? Int64 == productID {
                        $0.setValue(newQuantity, forKey: "quntity")
                    }
                }
    
                try context.save()
                updateInvoiceTotal(context: context)

            } catch {
                NSLog("Failed to update product quantity: \(error.localizedDescription)")
            }
        }
    }
    
 
    
    func deletProduct(productID: Int64, context: NSManagedObjectContext) {
        context.performAndWait {
            let invoice = getOrCreateInvoice(context: context)
            
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
                updateInvoiceTotal(context: context)
 
            } catch {
                NSLog("Failed to update product quantity: \(error.localizedDescription)")
            }
        }
    }

    func updateInvoiceTotal(context: NSManagedObjectContext) {
        let invoice = getOrCreateInvoice(context: context)
        var totalPrice = 0.0
        var totalQuantity = 0
        
        // إعداد طلب البحث لجلب جميع المنتجات في الفاتورة
        let fetchRequest: NSFetchRequest<CartProductEntity> = CartProductEntity.fetchRequest()  // تحديد النوع بشكل صحيح
        fetchRequest.predicate = NSPredicate(format: "invoice == %@", invoice)
        
        do {
            let results = try context.fetch(fetchRequest)
            for product in results {
                let quantity = product.quntity
                let price = product.price
                totalQuantity += Int(quantity)
                totalPrice += Double(quantity) * price

            }
            invoice.totalPrice = totalPrice
            invoice.totalQuantity = Int32(totalQuantity)
            print(" invoice.totalPrice invoice.totalPrice invoice.totalPrice")
            print( invoice.totalPrice)
            print(" invoice.totalQuantity invoice.totalQuantity invoice.totalQuantity")
            print( invoice.totalQuantity)
            try context.save()
        } catch {
            print("فشل في حساب إجمالي الفاتورة: \(error.localizedDescription)")
        }
    }

    func deleteCurrentInvoice(context: NSManagedObjectContext) {
        context.performAndWait {
            // الحصول على الفاتورة الحالية
            guard let invoiceID = currentInvoiceID, let invoice = fetchInvoice(byID: invoiceID, context: context) else {
                print("No current invoice to delete.")
                return
            }

            // حذف الفاتورة من السياق
            context.delete(invoice)

            do {
                // حفظ التغييرات
                try context.save()
                // مسح معرف الفاتورة الحالية
                clearCurrentInvoice()
                print("Current invoice deleted successfully.")
            } catch {
                NSLog("Failed to delete current invoice: \(error.localizedDescription)")
            }
        }
    }
}
