//
//  ContractHome.swift
//  ViperShoping
//
//  Created by Mahmoud on 08/07/2023.
//

import UIKit

 protocol HomeViewProtocol :AnyObject {
 // MARK: - Variables
        var presenter : HomePresenterProtocol? {get}
 // MARK: - Functions
        func reloadView()
        func updatePageControl(count: Int)
 }
   protocol HomePresenterProtocol : AnyObject {
  // MARK: - Variables
         var view : HomeViewProtocol? {get set}
         var wireframe : HomeWireFrameProtocol? {get set}
         var interactor : HomeInteractorInputProtocol?{get set}
         var allBanner :  [AllBanners]? {get set}
         var allProductHome :[AllProducts]? {get set}
 // MARK: - Functions
         func viewDidLoad()
         func routeToView(view:UIViewController)
   
  }
    protocol HomeInteractorInputProtocol : AnyObject {
// MARK: - Variables
        var outPut: HomeInteractorOutputProtocol? { get set }
// MARK: - Functions
        func getData()
}
   protocol HomeInteractorOutputProtocol: AnyObject {
 // MARK: - Functions
        func getDataSuccessfully(data: HomeModel?)
        func getFetchingFailed(withError error: String)
}
    protocol HomeWireFrameProtocol: AnyObject {
 // MARK: - Variables
        var viewController : UIViewController?{get set}
// MARK: - Functions
        static func assembleModule() -> UIViewController
        func presentToView(view:UIViewController) 
        func alerError(error:String)
}
