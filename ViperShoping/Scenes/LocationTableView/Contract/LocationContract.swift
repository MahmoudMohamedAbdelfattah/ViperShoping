//
//  LocationContract.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 14/7/2024.
//

import Foundation

import UIKit
 
protocol LocationViewProtocol :AnyObject {
          // MARK: - Variables
         var presenter : LocationPresenterProtocol? {get}
     }
protocol LocationPresenterProtocol : AnyObject{
         // MARK: - Variables
         var view : LocationViewProtocol? {get set}
         var wireframe : LocationWireFrameProtocol? {get set}
     }
protocol LocationWireFrameProtocol: AnyObject {
 // MARK: - Variables
         var viewController : UIViewController?{get set}
 // MARK: - Functions
         static func assembleModule() -> UIViewController
     }
