//
//  SceneDelegate.swift
//  ViperShoping
//
//  Created by Mahmoud on 06/06/2023.
//

import UIKit
import IQKeyboardManagerSwift
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    private(set) static var shared: SceneDelegate?
    var window: UIWindow?


   
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
   
        
        guard let  windowScen = (scene as? UIWindowScene) else { return }
     
         window = UIWindow(windowScene: windowScen)
         
//  RootManager.rootViewController(for: window ?? UIWindow(), with: nil, rootViewController: TabBarWireFrame.assembleModule())
  

        
   //     RootManager.rootViewController(for: window ?? UIWindow(), with: nil, rootViewController: NewPhoneViewController())
        
    // RootManager.rootViewController(for: window ?? UIWindow(), with: nil, rootViewController: UpdateAddressWireFram.assembleModule())
        
 
 
        
   if Component.shared.getApiToken() != nil {
            RootManager.rootViewController(for: window ?? UIWindow(), with: nil, rootViewController: TabBarWireFrame.assembleModule())
        } else {
            RootManager.rootViewController(for: window ?? UIWindow(), with: nil, rootViewController: EnteryWireFrame.assembleModule())
            print("No Token")
        }
 

    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
      //  UIApplication.getTopMostViewControllerr()?.present(LockWireFrame.assembleModule(), animated: true)
       // UIApplication.getTopMostViewControllerr()?.navigationController?.pushViewController(LockWireFrame.assembleModule(), animated: true)


    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
      
    
       UIApplication.getTopMostViewControllerr()?.present(LockWireFrame.assembleModule(), animated: true)

 
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

