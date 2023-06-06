//
//  ExtentionUIApplication.swift
//  ViperShoping
//
//  Created by Mahmoud on 20/06/2023.
//

import UIKit

 
//
// extension UIApplication {
//
//
//     class func resetApp() -> UIViewController {
//             let window = UIApplication.shared.connectedScenes
//                 .filter({ $0.activationState == .foregroundActive })
//                 .map({$0 as? UIWindowScene})
//                 .compactMap({ $0 })
//                 .first?.windows
//                 .filter({ $0.isKeyWindow }).first
//             window?.makeKeyAndVisible()
//         return window?.rootViewController ?? UIViewController()
//          }
     
     
     
 //    var mainWindow : UIWindow {


//         UIApplication.shared.connectedScenes
//             .filter({ $0.activationState == .foregroundActive })
//             .map({$0 as? UIWindowScene})
//             .compactMap({ $0 })
//             .first?.windows
//             .filter({ $0.isKeyWindow }).first ?? UIWindow()
        // UIApplication.presentRootScreen(in: window, vc: ProductRouter.assembleModule())

    // }
   
//     class func topViewController(viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
//         if let nav = viewController as? UINavigationController {
//             return topViewController(viewController: nav.visibleViewController)
//         }
//         if let tab = viewController as? UITabBarController {
//             if let selected = tab.selectedViewController {
//                 return topViewController(viewController: selected)
//             }
//         }
//         if let presented = viewController?.presentedViewController {
//             return topViewController(viewController: presented)
//         }
//         return viewController
//     }
//}


 

//
//class RootRouter {
//
//    static func presentRootScreen(in window: UIWindow?, vc: UIViewController) {
//        window?.makeKeyAndVisible()
//        window?.rootViewController = vc
//    }
//
//
//}



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
    
//    func getTopMostViewController() -> UIViewController? {
//        var topMostViewController = UIApplication.shared.keyWindow?.rootViewController
//
//        while let presentedViewController = topMostViewController?.presentedViewController {
//            topMostViewController = presentedViewController
//        }
//
//        return topMostViewController
//    }
}
 
