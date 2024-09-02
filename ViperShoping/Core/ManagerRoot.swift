//
//  ManagerRoot.swift
//  ViperShoping
//
//  Created by Mahmoud on 21/06/2023.
//

import UIKit

class RootManager  {
    
    
    
  static  func rootViewController(for window: UIWindow, with scene: UIScene? = nil, rootViewController: UIViewController) {
        let windowScene: UIWindowScene
        
        if let scene = scene as? UIWindowScene {
            windowScene = scene
        } else if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            windowScene = scene
        } else {
            fatalError("Unable to find a UIWindowScene.")
        }
       
      
         let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.isNavigationBarHidden = true
        window.windowScene = windowScene
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    static func presentRootScreen(in window: UIWindow?, vc: UIViewController) {
        window?.makeKeyAndVisible()
        window?.rootViewController = vc
    }
    
    static func resetApp() {
            let window = UIApplication.shared.connectedScenes
                .filter({ $0.activationState == .foregroundActive })
                .map({$0 as? UIWindowScene})
                .compactMap({ $0 })
                .first?.windows
                .filter({ $0.isKeyWindow }).first
            
         //   presentRootScreen(in: window, vc: ProductRouter.assembleModule())
        }
    
}



// MahmoudMohamedAbdelfattah
