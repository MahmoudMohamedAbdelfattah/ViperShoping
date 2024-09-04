//
//  CartProductViewController.swift
//  ViperShoping
//
//  Created by Mahmoud on 02/10/2024.
//

import UIKit
import CoreData
class CartProductViewController: UIViewController , CartProductViewProtocol {

    // MARK: - IBOutlets
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var cartTable: UITableView!{
        didSet {
            cartTable.delegate = self
            cartTable.dataSource = self
            cartTable.register(UINib(nibName: "CartCell", bundle: nil), forCellReuseIdentifier: "CartCell")
    }
}
     // MARK: - Properties
    var presenter: CartPresenterProtocol?
    var data = CartProductEntity()
    var allData = [CartProductEntity]()
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        cartTable.addViewBorder(borderColor: UIColor.orange.cgColor, borderWith: 3, borderCornerRadius: 10)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         DispatchQueue.main.async {
           Component.shared.basicAnimations(Image: self.imageLogo)
        }
    }
 
    func reloadView() {
          self.cartTable.reloadData()
    }
     // MARK: - @IBAction
    @IBAction func dismissView(_ sender: UIButton) {
        presenter?.routeToDismiss()
    }
}
