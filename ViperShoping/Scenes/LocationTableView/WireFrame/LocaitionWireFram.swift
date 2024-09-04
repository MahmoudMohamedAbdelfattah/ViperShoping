//
//  LocaitionWireFram.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 14/7/2024.
//

 import UIKit
import Foundation
 class LocationWireFrame : LocationWireFrameProtocol {
 // MARK: - Variables
        var viewController: UIViewController?
 // MARK: - Functions
    static func assembleModule() -> UIViewController {
        let view : LocationListViewController = LocationListViewController.loadFromNib()
            let wireframe = LocationWireFrame()
            let presenter =  LocationViewPresenter()
            view.presenter = presenter
            wireframe.viewController = view
            return view
            }
    }
   
