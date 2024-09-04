//
//  ChooseLoginViewController.swift
//  ViperShoping
//
//  Created by Mahmoud on 20/06/2024.
//

import UIKit

class ChooseLoginViewController: UIViewController , ChooseLoginViewProtocol{
 
// MARK: - IBOutlets
     @IBOutlet weak var WelcomLbl: UILabel!
    // MARK: - Variables
      var presenter: ChooseLoginPresenterProtocol?
 
// MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()

     }
    
// MARK: - Acition
    @IBAction func createAccount(_ sender: Any) {
        presenter?.routeToRegisterScreen()
    }
    
    @IBAction func signIn(_ sender: UIButton) {
        presenter?.routeTologinScreen()
    }
 }
