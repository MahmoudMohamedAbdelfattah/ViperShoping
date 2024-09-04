//
//  FaqsViewController.swift
//  ViperShoping
//
//  Created by Mahmoud on 23/07/2024.
//

import UIKit

class FaqsViewController: UIViewController ,FaqsViewProtocol {
  
    // MARK: - IBOutlets
            @IBOutlet weak var slidMenuImage: UIImageView!
            @IBOutlet weak var logoImage: UIImageView!
            @IBOutlet weak var posterImage: UIImageView!
            @IBOutlet weak var faqsTableView: UITableView!{
                didSet {
                    faqsTableView.delegate = self
                    faqsTableView.dataSource = self
                    faqsTableView.register(UINib(nibName: "faqsCell", bundle: nil), forCellReuseIdentifier: "faqsCell")
                }
    }
    // MARK: - Properties
            var presenter: FaqsPresenterProtocol?
         
    // MARK: - Methods
            override func viewDidLoad() {
                super.viewDidLoad()
                uiTapGesture()
                 presenter?.viewDidLoad()
                 faqsTableView.addViewBorder(borderColor: UIColor.orange.cgColor, borderWith: 3, borderCornerRadius: 10)
           }
    
            override func viewWillAppear(_ animated: Bool) {
                 super.viewWillAppear(animated)
                     DispatchQueue.main.async {
                        Component.shared.basicAnimations(Image: self.logoImage)
                }
         }

            func reloadData() {
                DispatchQueue.main.async {
                    self.faqsTableView.reloadData()
                }
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
