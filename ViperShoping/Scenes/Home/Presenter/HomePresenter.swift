//
//  HomePresenter.swift
//  ViperShoping
//
//  Created by Mahmoud on 08/07/2024.
//

import UIKit

 class HomePresenter : HomePresenterProtocol{
    
    // MARK: - Variables
    weak var view: HomeViewProtocol?
    var wireframe: HomeWireFrameProtocol?
    var interactor: HomeInteractorInputProtocol?
    var allBanner: [AllBanners]?
    var allProductHome: [AllProducts]?
    
    // MARK: - Methods
     func viewDidLoad() {
          interactor?.getData()
      }
 
    func setNumberOfPageControl(_ count: Int) {
        view?.updatePageControl(count: count)
    }
    
    func routeToView(view: UIViewController) {
        wireframe?.presentToView(view: view)
    }
}
 
extension  HomePresenter : HomeInteractorOutputProtocol {
  // MARK: - Methods
    func getDataSuccessfully(data: HomeModel?) {
            self.allBanner = data?.data?.banners
            self.allProductHome = data?.data?.products
            DispatchQueue.main.async {
                self.view?.updatePageControl(count: data?.data?.banners?.count ?? 0)
                self.view?.reloadView()
          }
     }
    
    func getFetchingFailed(withError error: String) {
            wireframe?.alerError(error: error)
     }
}
