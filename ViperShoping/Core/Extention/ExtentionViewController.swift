//
//  UIViewController.swift
//  ViperShoping
//
//  Created by Mahmoud on 21/06/2023.
//

import Foundation

import UIKit
 
extension UIViewController {
    
    static func loadFromNib<T: UIViewController>() -> T {
        return T(nibName: String(describing: self), bundle: nil)
    }
 
    var topViewController: UIViewController? {
        if let presented = self.presentedViewController {
            return presented.topViewController
        }
        if let navigation = self as? UINavigationController {
            return navigation.visibleViewController?.topViewController
        }
        if let tab = self as? UITabBarController {
            return tab.selectedViewController?.topViewController
        }
        return self
    }
}

 
