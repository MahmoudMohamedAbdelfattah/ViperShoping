//
//  DetailesInvoicesViewController.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 9/8/2024.
//

import UIKit

class DetailesInvoicesViewController: UIViewController , DetailsInvoiceProductViewProtocol {
    
    // MARK: - IBOutlets
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var DetailesInvoiceTableView: UITableView!{
        didSet {
            DetailesInvoiceTableView.delegate = self
            DetailesInvoiceTableView.dataSource = self
            DetailesInvoiceTableView.register(UINib(nibName: "DetailesInvoicesCell", bundle: nil), forCellReuseIdentifier: "DetailesInvoicesCell")
        }
    }
    
    // MARK: - Properties
    var presenter: DetailsInvoicePresenterProtocol?

    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        DetailesInvoiceTableView.addViewBorder(borderColor: UIColor.orange.cgColor, borderWith: 3, borderCornerRadius:  10)
     }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
           Component.shared.basicAnimations(Image: self.imageLogo)
        }
    }
    
    func reloadView() {
        DispatchQueue.main.async {
            self.DetailesInvoiceTableView.reloadData()
        }
    }
 
    // MARK: - @IBAction
     @IBAction func dissmisButton(_ sender: Any) {
        presenter?.routeToDismiss()
     }
    
    @IBAction func exiteButton(_ sender: Any) {
        presenter?.routeToHomeScreen()
    }
}
