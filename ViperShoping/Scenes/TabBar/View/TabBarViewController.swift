//
//  TabBarViewController.swift
//  ViperShoping
//
//  Created by Mahmoud on 19/07/2024.
//

import UIKit

class TabBarViewController: UITabBarController , TabBarViewProtocol {
   
 // MARK: - Properties
     var presenter: TabBarPresenterProtocol?
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
// MARK: - Methods
     override func viewDidLoad() {
        super.viewDidLoad()
             tabBarLayer()
       }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func tabBarLayer() {
        self.tabBar.layer.cornerRadius = 20
        self.tabBar.layer.masksToBounds = true
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
  }

 
  
