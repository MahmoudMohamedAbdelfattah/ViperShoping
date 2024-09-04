//
//  FavoriteProductInterectore.swift
//  ViperShoping
//
//  Created by Mahmoud on 19/09/2024.
//

import CoreData
import UIKit
 
class FavoriteProductInteractor: FavoriteInteractorInputProtocol {
 
    // MARK: - Variables
        var outPut: FavoriteInteractorOutputProtocol?
      
    // MARK: - Functions
    
    func getData() {
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else{return}

        var favoriteProduct  = CategoryDataDetials()
 
        let  Context = appdelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"FavoriteProductEntity")
        do {
            let result = try Context.fetch(fetchRequest) as! [NSManagedObject]
            
                result.map{
                    let productName = $0.value(forKey: "name")
                    let productImage = $0.value(forKey: "image")
                    let productId = $0.value(forKey: "id")
                    let productPrice = $0.value(forKey: "price")
                    let productDiscount = $0.value(forKey: "discount")
                    let productOldPrice = $0.value(forKey: "old_price")
                
                    favoriteProduct.name = productName as? String
                    favoriteProduct.image = productImage  as? String
                    favoriteProduct.id = productId as? Int
                    favoriteProduct.discount = productDiscount as? Int
                    favoriteProduct.old_price = productOldPrice as? Double
                    favoriteProduct.price = productPrice as? Double
                    outPut?.getDataSuccessfully(data: [favoriteProduct])
            }
        }
         catch{
            
        }
    }
}

 
