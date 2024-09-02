//
//  CartProductContract.swift
//  ViperShoping
//
//  Created by Mahmoud on 02/10/2023.
//
 
import UIKit
import CoreData

    protocol CartProductViewProtocol :AnyObject {
    // MARK: - Variables
          var presenter : CartPresenterProtocol? {get}
          func reloadView()
 }
    protocol CartPresenterProtocol : AnyObject {
  // MARK: - Variables
         var view : CartProductViewProtocol? {get set}
         var wireframe : CartWireFrameProtocol? {get set}
         var interactor : CartInteractorInputProtocol?{get set}
         var CartProduct : [Invoice]? {get set}
  // MARK: - Functions
         func viewDidLoad()
         func routeToDismiss()
         func routeToView(view:UIViewController)
   }
    protocol CartInteractorInputProtocol : AnyObject {
// MARK: - Variables
        var outPut: CartInteractorOutputProtocol? { get set }
// MARK: - Functions
        func getData()
    }
   protocol CartInteractorOutputProtocol: AnyObject {
 // MARK: - Functions
         func usersFetchedSuccessfully(data: [Invoice]?)
   }
    protocol CartWireFrameProtocol: AnyObject {
 // MARK: - Variables
        var viewController : UIViewController?{get set}
// MARK: - Functions
        static func assembleModule() -> UIViewController
        func dismissView()
        func presentToView(view:UIViewController)
    }
