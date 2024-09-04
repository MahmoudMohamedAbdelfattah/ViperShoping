//
//  TermsViewController.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 27/8/2024.
//

import UIKit
 class TermsViewController: UIViewController , TermsViewProtocol {
 
    // MARK: - IBOutlets
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var termsTxt: UITextView!
    @IBOutlet weak var aboutTxt: UITextView!
    @IBOutlet weak var mainStack: UIStackView!
    @IBOutlet var allStack: [UIStackView]!
    
    // MARK: - Properties
    var presenter: TermsPresenterProtocol?
  
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainStack.addViewBorder(borderColor: UIColor.white.cgColor, borderWith: 2, borderCornerRadius: 20)
        setupBackGroundAllStack()
        presenter?.PostdidLoadData()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
           Component.shared.basicAnimations(Image: self.imageLogo)
        }
    }
   
    func setupBackGroundAllStack() {
        _ = allStack.map{
             $0.backgroundColor = .clear
         }
    }
    
    func data(about:String,terms:String){
        self.termsTxt.text = terms
        self.aboutTxt.text = about
    }
    
    // MARK: - @IBAction
    @IBAction func backButton(_ sender: Any) {
        presenter?.dismissView()
    }
}
