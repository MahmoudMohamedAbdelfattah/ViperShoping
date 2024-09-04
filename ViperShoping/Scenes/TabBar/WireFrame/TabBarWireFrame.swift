//
//  TabBarRouter.swift
//  ViperShoping
//
//  Created by Mahmoud on 19/07/2024.
 
 
import UIKit
import Foundation

class TabBarWireFrame : TabBarWireFrameProtocol {
 
 // MARK: - Variables
     var viewController: UIViewController?
 // MARK: - Functions
     static func assembleModule() -> UIViewController {
       
         let Home = "Home".localized
         let Category = "Category".localized
         let FAQS = "FAQS".localized
      
         
         let homeModule = HomeWireFrame.assembleModule()
         let HometabBarItem = UITabBarItem(title: Home, image:UIImage(systemName: "homekit"), tag: 0)
        let categoryModule = CategoryWireFrame.assembleModule()
        let categoryTabBarItem = UITabBarItem(title: Category, image: UIImage(systemName:   "doc.richtext.fill.ko"), tag: 1)
         let fqs = FaqsWireFrame.assembleModule()
         let subCategorytabBarItem = UITabBarItem(title: FAQS, image: UIImage(systemName: "questionmark.square.fill.ar"), tag: 2)
         let view : TabBarViewController = TabBarViewController.loadFromNib()
          let wireframe = TabBarWireFrame()
         let presenter =  TabBarPresenter()
         view.presenter = presenter
         presenter.view = view
         presenter.wireframe = wireframe
         homeModule.tabBarItem = HometabBarItem
         fqs.tabBarItem = subCategorytabBarItem
         categoryModule.tabBarItem = categoryTabBarItem
         view.viewControllers = [homeModule,categoryModule,fqs]
         return view
    }
}
