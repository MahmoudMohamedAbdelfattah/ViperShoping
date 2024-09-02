//
//  AppDelegate.swift
//  ViperShoping
//
//  Created by Mahmoud on 06/06/2023.
//

import CoreData
import UIKit
import IQKeyboardManagerSwift
import Network
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    static var shared : AppDelegate = AppDelegate()
    
    class func appDelegate() -> AppDelegate {

    return UIApplication.shared.delegate as! AppDelegate

    }
    var window: UIWindow?
//    
//    func internetStatus(){
//
//       let nwPathMonitor = NWPathMonitor()
//       nwPathMonitor.start(queue: DispatchQueue(label: "network_monitor"))
//       nwPathMonitor.pathUpdateHandler = { path in
//          
//           if (path.status == .satisfied){
//               if (path.usesInterfaceType(.wifi)){
//                   print("wifi")
//               }
//               if (path.usesInterfaceType(.cellular)){
//                   print("cellular")
//               }
//           }
//           else if (path.status == .unsatisfied)
//           {
//               print("noConnectionnnnnnnnnnnnnn")
//           }
//           else if (path.status == .requiresConnection){
//               print("requiresConnection")
//
//           }
//       }
//   }
    func deleteAllEntities() {
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else {return}

        let entities = appdelegate.persistentContainer.managedObjectModel.entities
        for _ in entities {
         delete(entityName: "Invoice")
           delete(entityName: "CartProductEntity")
        }
    }
    
    func delete(entityName: String) {
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else {return}

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try appdelegate.persistentContainer.viewContext.execute(deleteRequest)
        } catch let error as NSError {
            debugPrint(error)
        }
    }
//    @objc func showOfflineDeviceUI(notification: Notification) {
//        if NetworkMonitor.shared.isConnected {
//            print("Connected")
//        } else {
//            print("Not connected")
//        }
//    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//   
        
         //        UITabBar.appearance().tintColor = UIColor.yellow
        //        UITabBar.appearance().unselectedItemTintColor = UIColor.white
        //        UITabBar.appearance().backgroundColor = UIColor.black.withAlphaComponent(0.7)
        //
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .orange

  //  deleteAllEntities()
    //    NetworkMonitor.shared.internetStatus()
   //     UIApplication.getTopMostViewControllerr()?.present(LockWireFrame.assembleModule(), animated: true)

//        NetworkMonitor.shared.startMonitoring()
//
//        
//        NotificationCenter.default.addObserver(self, selector: #selector(showOfflineDeviceUI(notification:)), name: NSNotification.Name.connectivityStatus, object: nil)
        
        IQKeyboardManager.shared.enable = true
        Localizer.start()
      //  Localizer.swizzleUIMethods()
   //     KeyboardManager.shared.configureKeyboard()

        if UIDevice.current.userInterfaceIdiom == .pad {
            let fontSize: CGFloat = 25
            UIFont.setDefaultFont(size: fontSize)
        } else {
            let fontSize: CGFloat = 14
            UIFont.setDefaultFont(size: fontSize)
        }
       // NetworkMonitor.shared.startNetworkMonitoring()
  
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "CoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                 fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
}

 


extension UIButton {
   @objc dynamic var titleLabelFont: UIFont! {
       get { return self.titleLabel?.font }
       set { self.titleLabel?.font = newValue }
   }
}

 

 
