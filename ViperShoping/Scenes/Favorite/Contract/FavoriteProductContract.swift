//
//  contractFavoriteProduct.swift
//  ViperShoping
//
//  Created by Mahmoud on 18/09/2024.
//

import Foundation
import UIKit

    protocol FavoriteProductViewProtocol :AnyObject {
    // MARK: - Variables
            var presenter : FavoritePresenterProtocol? {get}
 }

   protocol FavoritePresenterProtocol : AnyObject {
  // MARK: - Variables
         var view : FavoriteProductViewProtocol? {get set}
         var wireframe : FavoriteWireFrameProtocol? {get set}
         var interactor : FavoriteInteractorInputProtocol?{get set}
         var favoriteProduct : [CategoryDataDetials]? {get set}
 // MARK: - Functions
         func viewDidLoad()
         func routeToDismiss()

  }
    protocol FavoriteInteractorInputProtocol : AnyObject {
// MARK: - Variables
        var outPut: FavoriteInteractorOutputProtocol? { get set }
// MARK: - Functions
        func getData()
}
   protocol FavoriteInteractorOutputProtocol: AnyObject {
 // MARK: - Functions
        func getDataSuccessfully(data: [CategoryDataDetials]?)
 }
    protocol FavoriteWireFrameProtocol: AnyObject {
 // MARK: - Variables
        var viewController : UIViewController?{get set}
// MARK: - Functions
        static func assembleModule() -> UIViewController
        func dismissView()
}
