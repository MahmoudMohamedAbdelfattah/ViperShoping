//
//  IndicatorViewController.swift
//  ViperShoping
//
//  Created by Mahmoud on 08/07/2023.
//

import UIKit

class IndicatorViewController: UIViewController  , IndicatorViewProtocol{
 

// MARK: - IBOutlets
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    // MARK: - Variables
        var presenter: IndicatorPresenterProtocol?
        static var ss : IndicatorViewController = IndicatorViewController()
// MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
         presenter?.viewDidLoad()
      }

    func showLoadingIndicator() {
        indicator.startAnimating()
    }
    
    func hideLoadingIndicator() {
        indicator.stopAnimating()
    }
 }
