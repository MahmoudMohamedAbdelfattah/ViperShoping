//
//  AlertViewController.swift
//  ViperShoping
//
//  Created by Mahmoud on 09/07/2023.
//

import UIKit

class AlertViewController: UIViewController , AlertViewProtocol {
    
    // MARK: - IBOutlets
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    // MARK: - Properties
    var presenter: AlertPresenterProtocol?
     // MARK: - Method
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.didLoad()
         messageLabel.text = presenter?.message
        scrollView.addViewBorder(borderColor: UIColor.orange.cgColor, borderWith: 3, borderCornerRadius: 20)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }
    
    // MARK: - Method Acition
    @IBAction func dismissButton(_ sender: UIButton) {
             presenter?.dismissView()
 
    }
 }
