//
//  DetailesInvoicesPresenter.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 9/8/2024.
//

import Foundation

import UIKit
import CoreData
 
class DetailsInvoiceProductPresenter : DetailsInvoicePresenterProtocol{
    
    // MARK: - Variables
    weak var view: DetailsInvoiceProductViewProtocol?
    var wireframe: DetailsInvoiceWireFrameProtocol?
    var interactor: DetailsInvoiceInteractorInputProtocol?
    var DetailsInvoice: [CartProductEntity] = []
 
    // MARK: - Methods
        func viewDidLoad(detailsInvoiceProduct:[CartProductEntity]) {
  
            interactor?.getData(detailsInvoiceProduct:detailsInvoiceProduct)
        }
        func routeToDismiss() {
            wireframe?.dismissView()
        }
        func routeToHomeScreen() {
            wireframe?.pushToHome()
        }
  }
 
extension  DetailsInvoiceProductPresenter : DetailsInvoiceInteractorOutputProtocol {

  // MARK: - Methods
    func usersFetchedSuccessfully(data: [CartProductEntity]) {
            self.DetailsInvoice = data
            self.view?.reloadView()
      }
}

