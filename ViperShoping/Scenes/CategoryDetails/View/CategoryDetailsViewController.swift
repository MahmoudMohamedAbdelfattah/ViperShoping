//
//  CategoryDetailsViewController.swift
//  ViperShoping
//
//  Created by Mahmoud on 20/07/2024.
//  CoreData.xcdatamodel

import UIKit
import CoreData

class CategoryDetailsViewController: UIViewController , CategoryDetailsViewProtocol {
 
    // MARK: - IBOutlets
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var stackSearch: UIStackView!
    @IBOutlet weak var searchTxt: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var stackTotalQuntityAndPrice: UIStackView!
    @IBOutlet var stackDeatailsInvoice: [UIStackView]!
    @IBOutlet weak var totalQuntityLbl: UILabel!
    @IBOutlet weak var totalPriceLbl: UILabel!
    @IBOutlet weak var viewCart: ViewLayer!
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var categoryDetailsTableView: UITableView!{
           didSet {
               categoryDetailsTableView.delegate = self
               categoryDetailsTableView.dataSource = self
               categoryDetailsTableView.register(UINib(nibName: "CategoryDetailsCell", bundle: nil), forCellReuseIdentifier: "CategoryDetailsCell")
            }
        }
    
    // MARK: - Properties
    var isSearch = false
    let invoiceManager = InvoiceManager()
    var presenter: CategoryDeatailsPresenterProtocol?
    weak var delegate: CartMangerProtocol?
    override var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent
    }
 
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryDetailsTableView.addViewBorder(borderColor: UIColor.orange.cgColor, borderWith: 3, borderCornerRadius:  10)
        presenter?.favoriteIdCoreData()
        stackSearch.backgroundColor = .clear
        setupBackgoundStack()
        searchTxt.addViewBorder(borderColor: UIColor.white.withAlphaComponent(0.5).cgColor, borderWith: 1, borderCornerRadius: 4)
        viewCart.isHidden = true
        self.searchTxt.addTarget(self, action: #selector(textField),
                                 for: UIControl.Event.editingChanged)
    }
    
    func setupBackgoundStack() {
        _ = stackDeatailsInvoice.map{$0.backgroundColor = .clear}
    }
    
    
    @objc func textField() {
        guard let searchText = searchTxt.text , !searchText.isEmpty else{
            isSearch = false
            return}
        self.presenter?.searchProduct(text: searchTxt.text)
        isSearch = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            DispatchQueue.main.async {
               Component.shared.basicAnimations(Image: self.imageLogo)
        }
    }
  
    func reloadView() {
        DispatchQueue.main.async {
            self.categoryDetailsTableView?.reloadData()
        }
    }
 
  
    func totalQuntityAndPrice(totalQuntity: Int?, totalPrice: Double?) {
        
         if totalQuntity == 0 {
             self.viewCart.isHidden = true
             self.dismissButton.isHidden = false
        } else {
            self.viewCart.isHidden = false
            self.dismissButton.isHidden = true
            self.totalQuntityLbl.text = "\(totalQuntity ?? 0)"
            self.totalPriceLbl.text = "\(totalPrice ?? 0)"
        }
    }
 
    // MARK: - @IBAction
     @IBAction func dismissButton(_ sender: UIButton) {
         self.navigationController?.popViewController(animated: true)
     }
    
    @IBAction func save(_ sender: Any) {
        presenter?.postClearCurrentInvoice()
        presenter?.routeToCartScreen()
     }
 }
