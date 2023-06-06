//
//  DetailesInvoicesContract.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 9/8/2024.
//
 
import UIKit
import CoreData

    protocol DetailsInvoiceProductViewProtocol :AnyObject {
    // MARK: - Variables
          var presenter : DetailsInvoicePresenterProtocol? {get}
          func reloadView()
    }

    protocol DetailsInvoicePresenterProtocol : AnyObject {
  // MARK: - Variables
         var view : DetailsInvoiceProductViewProtocol? {get set}
         var wireframe : DetailsInvoiceWireFrameProtocol? {get set}
         var interactor : DetailsInvoiceInteractorInputProtocol?{get set}
        var DetailsInvoice: [CartProductEntity] {get set}
 
 // MARK: - Functions
         func viewDidLoad(detailsInvoiceProduct:[CartProductEntity])
         func routeToDismiss()
        func routeToHomeScreen()
    }

    protocol DetailsInvoiceInteractorInputProtocol : AnyObject {
// MARK: - Variables
        var outPut: DetailsInvoiceInteractorOutputProtocol? { get set }
// MARK: - Functions
        func getData(detailsInvoiceProduct:[CartProductEntity])
    }

   protocol DetailsInvoiceInteractorOutputProtocol: AnyObject {
 // MARK: - Functions
         func usersFetchedSuccessfully(data: [CartProductEntity])
        func usersFetchingFailed(withError error: String)
   }

    protocol DetailsInvoiceWireFrameProtocol: AnyObject {
 // MARK: - Variables
        var viewController : UIViewController?{get set}
// MARK: - Functions
        static func assembleModule(detailsInvoiceProduct:[CartProductEntity]) -> UIViewController
        func dismissView()
        func pushToHome()
     }
