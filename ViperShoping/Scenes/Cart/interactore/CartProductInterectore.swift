//
//  CartProductInterectore.swift
//  ViperShoping
//
//  Created by Mahmoud on 02/10/2023.
//

 
import CoreData
import UIKit
 
class CartProductInteractor: CartInteractorInputProtocol {
 
    // MARK: - Variables
        var outPut: CartInteractorOutputProtocol?
      
    // MARK: - Functions

    func getData() {
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else{return}
        var cartProduct  = Invoices()
         let  context = appdelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Invoice> = Invoice.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: false)
          fetchRequest.sortDescriptors = [sortDescriptor]
            
            do {
                let results = try context.fetch(fetchRequest)
                outPut?.usersFetchedSuccessfully(data: results)
            } catch {
             
            }
    }
 }
