//
//  ContractTAbBar.swift
//  ViperShoping
//
//  Created by Mahmoud on 19/07/2024.
//
 
import UIKit

     protocol TabBarViewProtocol :AnyObject {
// MARK: - Variables
        var presenter : TabBarPresenterProtocol? {get}
  }
 
     protocol TabBarPresenterProtocol : AnyObject{
// MARK: - Variables
        var view : TabBarViewProtocol? {get set}
        var wireframe : TabBarWireFrameProtocol? {get set}
  }
  
     protocol TabBarWireFrameProtocol: AnyObject {
// MARK: - Variables
        var viewController : UIViewController?{get set}
    
// MARK: - Functions
        static func assembleModule() -> UIViewController
}
