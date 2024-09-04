//
//  ExtentionUIApplication.swift
//  ViperShoping
//
//  Created by Mahmoud on 30/06/2024.
//

import UIKit
 
extension UIApplication {
    
      var mainWindow : UIWindow {
         UIApplication.shared.connectedScenes
            .filter({ $0.activationState == .foregroundActive })
            .map({$0 as? UIWindowScene})
            .compactMap({ $0 })
            .first?.windows
            .filter({ $0.isKeyWindow }).first ?? UIWindow()
     }
    
    
      var topViewController: UIViewController? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let mainWindow = windowScene.windows.first,
              let rootViewController = mainWindow.rootViewController else {
            return nil
        }
        return rootViewController.topViewController
    }
    
   static func getTopMostViewControllerr() -> UIViewController? {
        var windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        var mainWindow =  windowScene?.windows.first
       
        var topMostViewController = mainWindow?.rootViewController
        while let presentedViewController = topMostViewController?.presentedViewController {
            topMostViewController = presentedViewController
        }
       while let presentedViewController = topMostViewController?.navigationController {
           topMostViewController = presentedViewController
       }
       while let presentedViewController = topMostViewController?.tabBarController {
           topMostViewController = presentedViewController
       }
        return topMostViewController
    }
}
 
