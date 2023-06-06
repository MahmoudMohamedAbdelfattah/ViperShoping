//
//  Internet.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 25/6/2024.
//

import Foundation
import UIKit

import Network

protocol NetworkReachabilityProtocol: AnyObject {
     var networkPathMonitor: NWPathMonitor? { get set }
     func networkStatusChanged(isConnected: Bool)
     // To check network status
     func isNetworkAvailable() -> Bool
     // Start & Stop network monitoring
     func startNetworkMonitoring()
     func stopNetworkMonitoring()
}

//  class NetworkMonitor : NetworkReachabilityProtocol {
//    var networkPathMonitor: NWPathMonitor?
//    static var shared = NetworkMonitor()
//    func networkStatusChanged(isConnected: Bool) {
//        
//    }
//    
//   // typealias networkPathMonitor = NWPathMonitor()
//
//    func stopNetworkMonitoring() {
//       self.networkPathMonitor?.cancel()
//       self.networkPathMonitor = nil
//    }
//    
//    func startNetworkMonitoring() {
//       if self.networkPathMonitor == nil {
//          self.networkPathMonitor = NWPathMonitor()
//       }
//       let queue = DispatchQueue(label: "NetworkMonitoring")
//       self.networkPathMonitor?.pathUpdateHandler = { [weak self] (path) in
//         if self?.networkPathMonitor?.currentPath.status == .satisfied {
//            self?.networkStatusChanged(isConnected: true)
//         } else {
//            self?.networkStatusChanged(isConnected: false)
//         }
//     }
//     self.networkPathMonitor?.start(queue: queue)
//   }
//    
//    func isNetworkAvailable() -> Bool {
//        if self.networkPathMonitor?.currentPath.status == .satisfied {
//          return true
//       } else {
//          return false
//       }
//    }
//}



//final class NetworkMonitor {
//    static let shared = NetworkMonitor()
//
//    private let queue = DispatchQueue(label: "NetworkConnectivityMonitor")
//    private let monitor: NWPathMonitor
//
//    private(set) var isConnected = false
//    private(set) var isExpensive = false
//    private(set) var currentConnectionType: NWInterface.InterfaceType?
//
//    private init() {
//        monitor = NWPathMonitor()
//    }
//
//    func startMonitoring() {
//        monitor.pathUpdateHandler = { [weak self] path in
//            self?.isConnected = path.status != .unsatisfied
//            self?.isExpensive = path.isExpensive
//            self?.currentConnectionType = NWInterface.InterfaceType.allCases.filter { path.usesInterfaceType($0) }.first
//            
//           NotificationCenter.default.post(name: .connectivityStatus, object: nil)
//        }
//        monitor.start(queue: queue)
//    }
//
//    func stopMonitoring() {
//        monitor.cancel()
//    }
//    
//    
//}
//
//extension Notification.Name {
//    static let connectivityStatus = Notification.Name(rawValue: "connectivityStatusChanged")
//}
//
//extension NWInterface.InterfaceType: CaseIterable {
//    public static var allCases: [NWInterface.InterfaceType] = [
//        .other,
//        .wifi,
//        .cellular,
//        .loopback,
//        .wiredEthernet
//    ]
//}

class NetworkMonitor {
    let nwPathMonitor = NWPathMonitor()
    static var shared = NetworkMonitor()

    weak var viewController: UIViewController?

    func internetStatus(){
 
       nwPathMonitor.start(queue: DispatchQueue(label: "network_monitor"))
       nwPathMonitor.pathUpdateHandler = { path in
          
           if (path.status == .satisfied){
               if (path.usesInterfaceType(.wifi)){
                   print("wifi")
                   
               }
               if (path.usesInterfaceType(.cellular)){
                   print("cellular")
               }
               DispatchQueue.main.async {
                   UIApplication.shared.topViewController?.navigationController?.popToRootViewController(animated: true)
               }

               print("Connnnnnect")
               
           }
             if (path.status == .unsatisfied)
           {
               print("noConnectionnnnnnnnnnnnnn")
                 DispatchQueue.main.async {
                     UIApplication.shared.topViewController?.navigationController?.pushViewController(InternetWireFrame.assembleModule(), animated: true)
                 }
 
           }
                 if (path.status == .requiresConnection){
                     print("requiresConnection")
                 }
           }
       }
   }
 
 
