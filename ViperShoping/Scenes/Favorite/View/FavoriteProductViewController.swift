//
//  FavoriteViewController.swift
//  ViperShoping
//
//  Created by Mahmoud on 20/08/2023.
//

import UIKit

class FavoriteProductViewController: UIViewController , FavoriteProductViewProtocol {
 
    // MARK: - IBOutlets
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var favoriteTable: UITableView!{
        didSet {
            favoriteTable.delegate = self
            favoriteTable.dataSource = self
            favoriteTable.register(UINib(nibName: "FavoriteCell", bundle: nil), forCellReuseIdentifier: "FavoriteCell")
    }
}
    
    // MARK: - Properties
    var presenter: FavoritePresenterProtocol?
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteTable.addViewBorder(borderColor: UIColor.orange.cgColor, borderWith: 3, borderCornerRadius: 10)
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         DispatchQueue.main.async {
           Component.shared.basicAnimations(Image: self.imageLogo)
        }
    }
    
    // MARK: - Acition
    @IBAction func backView(_ sender: UIButton) {
        presenter?.routeToDismiss()
    }
    
}
