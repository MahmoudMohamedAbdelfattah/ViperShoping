//
//  cartmanager.swift
//  ViperShoping
//
//  Created by Mahmoud on 30/09/2024.
//

import UIKit

protocol CartMangerProtocol : AnyObject{
    
    func totalQuntity(quntity : Int)
}
 
class CartManger : CartMangerProtocol {
 
     // MARK: - Properties
        static let sharedInstance = CartManger()
        let view : CategoryDetailsViewController = CategoryDetailsViewController()
        var totalQuantity : Int = 0
 
    // MARK: - funcition
    func steupDelegate() {
        self.view.delegate = self
     }
    func totalQuntity(quntity: Int) {
        self.totalQuantity += quntity
        print("2loooooooooooooooo")
        print(self.totalQuantity)
    }
 
}


 
