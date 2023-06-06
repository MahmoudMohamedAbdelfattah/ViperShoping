//
//  SubCategoryViewController.swift
//  ViperShoping
//
//  Created by Mahmoud on 23/09/2023.
//

import UIKit

class SubCategoryViewController: UIViewController , SubCategoryViewProtocol {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var mainStack: UIStackView!
    @IBOutlet weak var nameProduct: UILabel!
    @IBOutlet weak var descriptionProduct: UITextView!
    @IBOutlet weak var priceProduct: UILabel!
    @IBOutlet weak var subCategoryImageCollection: UICollectionView!{
        didSet {
            subCategoryImageCollection.delegate = self
            subCategoryImageCollection.dataSource = self
            subCategoryImageCollection?.register(UINib(nibName: "SubCategoryViewCell", bundle: nil), forCellWithReuseIdentifier: "SubCategoryViewCell")
        }
    }
    
    
    var presenter: SubCategoryPresenterProtocol?
    private var timer = Timer()
    private var counter = 0
    
    func hideLoadingAndShowErrorMessage(error: String) {
        
        
     }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionProduct.isEditable = false
        subCategoryImageCollection.addViewBorder(borderColor: UIColor.orange.cgColor, borderWith: 3, borderCornerRadius: 10)
        mainView.addViewBorder(borderColor:  UIColor.orange.cgColor, borderWith: 3, borderCornerRadius: 10)
     }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         DispatchQueue.main.async {
           Component.shared.basicAnimations(Image: self.imageLogo)
        }
    }
   

    func reloadView() {
             self.subCategoryImageCollection.reloadData()
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.ChangAutoCollectionCell), userInfo: nil, repeats: true)
     }
    
    @objc func ChangAutoCollectionCell ()
    {
        if counter < presenter?.allProductCategoryDetails?.images?.count ?? 0 {
            let index = IndexPath.init(item: counter, section: 0)
            self.subCategoryImageCollection?.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
           // pageController?.currentPage = counter
            counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.subCategoryImageCollection?.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
          //  pageController?.currentPage = counter
        }
     }
    func getData(data: InfoSubCategory) {
            self.nameProduct.text = data.name
            if let  price = data.price {
                self.priceProduct.text = "\(String(describing: price))"
            }
      
            self.descriptionProduct.text = data.description
        print(data.description)
        }
    
    @IBAction func backViewButton(_ sender: UIButton) {
        presenter?.routeToDismiss()
    }
    
    }
 
