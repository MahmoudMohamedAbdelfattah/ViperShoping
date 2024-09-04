//
//  FaqsPresenter.swift
//  ViperShoping
//
//  Created by Mahmoud on 23/07/2024.
//
 
import UIKit
 
class FaqsPresenter : FaqsPresenterProtocol{
    
    // MARK: - Variables
             weak var view: FaqsViewProtocol?
             var wireframe: FaqsWireFrameProtocol?
             var interactor: FaqsInteractorInputProtocol?
             var allQuestion: [ALLData]?

    // MARK: - Methods
             func viewDidLoad() {
                  interactor?.getData()
             }
    
            func routeToView(view: UIViewController) {
                wireframe?.presentToView(view: view)
            }
  }

extension  FaqsPresenter : FaqsInteractorOutputProtocol {
    // MARK: - Methods
            func getDataSuccessfully(data: FaqsModule?) {
                 self.allQuestion = data?.data?.data
                 self.view?.reloadData()
              }
    
            func getFetchingFailed(withError error: String) {
                 wireframe?.alerError(error: error)
             }
    }
