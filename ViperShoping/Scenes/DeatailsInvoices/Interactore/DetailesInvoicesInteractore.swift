//
//  DetailesInvoicesInteractore.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 9/8/2024.
//

import CoreData
import UIKit

class DetailsInvoiceProductInteractor: DetailsInvoiceInteractorInputProtocol {
  
    

   // MARK: - Variables
       var outPut: DetailsInvoiceInteractorOutputProtocol?
     
   // MARK: - Functions

    func getData(detailsInvoiceProduct: [CartProductEntity]) {
        
        print("IIIIII")
        print(detailsInvoiceProduct)
        outPut?.usersFetchedSuccessfully(data: detailsInvoiceProduct)
        
    }
   
   
}
