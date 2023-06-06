//
//  LockedViewController.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 28/7/2024.
//

import UIKit

class LockedViewController: UIViewController , LockViewProtocol{
    
    // MARK: - Properties
    var presenter: LockPresenterProtocol?
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
         presenter?.viewDidLoad()
     }

    // MARK: - @IBAction
    @IBAction func auth(_ sender: Any) {
        presenter?.viewDidLoad()
    }
    

}
