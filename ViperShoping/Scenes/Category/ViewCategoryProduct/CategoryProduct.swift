//
//  CategoryProduct.swift
//  ViperShoping
//
//  Created by Mahmoud on 17/07/2023.
//

import UIKit

class CategoryProduct: UIViewController , CategoryViewProtocol, UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
 
// MARK: - IBOutlets
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var slidMenuImage: UIImageView!
    @IBOutlet weak var ProductCollection: UICollectionView!{
        didSet {
            ProductCollection.delegate = self
            ProductCollection.dataSource = self
            ProductCollection?.register(UINib(nibName: "CellCategoryProduct", bundle: nil), forCellWithReuseIdentifier: "CellCategoryProduct")
         }
    }
// MARK: - Properties
        var presenter: CategorytPresenterProtocol?
        override var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent
        }
// MARK: - Methods
         override func viewDidLoad() {
            super.viewDidLoad()
             presenter?.viewDidLoad()
             uiTapGesture()
              ProductCollection.addViewBorder(borderColor: UIColor.orange.cgColor, borderWith: 3, borderCornerRadius: 10)
         }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        DispatchQueue.main.async {
            Component.shared.basicAnimations(Image: self.imageLogo)
            }
        }
    
          func reloadData() {
            DispatchQueue.main.async {
                self.ProductCollection.reloadData()
        }
    }
    
    func presentToCategoryDetail(id: Int) {
             presenter?.presentViewCategoryDetails(id: id)
     }
    
    func  uiTapGesture() {
        let tapGesturDecreser = UITapGestureRecognizer(target: self, action: #selector(imageTappedDecrese))
        slidMenuImage.isUserInteractionEnabled = true
        slidMenuImage.addGestureRecognizer(tapGesturDecreser)
    }
    
    @objc func imageTappedDecrese() {
         presenter?.routeToView(view: SlidMenuWireFrame.assembleModule(token: Component.shared.getApiToken() ?? ""))
    }
}
